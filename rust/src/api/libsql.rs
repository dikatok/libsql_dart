use std::{collections::HashMap, time::Duration};

use async_std::sync::Mutex;
use libsql::{Builder, Database};
use uuid::Uuid;

lazy_static::lazy_static! {
    static ref DATABASE_REGISTRY: Mutex<HashMap<String, Database>> = Mutex::new(HashMap::new());
}

pub struct CreateDbRequest {
    pub replica_path: String,
    pub sync_url: String,
    pub sync_token: String,
    pub sync_interval_milliseconds: Option<u64>,
}

pub struct CreateDbResponse {
    pub success: bool,
    pub db_id: Option<String>,
}

#[flutter_rust_bridge::frb(dart_async)]
pub async fn create_db(request: CreateDbRequest) -> CreateDbResponse {
    let connector = hyper_rustls::HttpsConnectorBuilder::new()
        .with_webpki_roots()
        .https_or_http()
        .enable_http1()
        .build();

    let mut db_builder =
        Builder::new_remote_replica(request.replica_path, request.sync_url, request.sync_token)
            .connector(connector);

    match request.sync_interval_milliseconds {
        Some(sync_interval) => {
            db_builder = db_builder.sync_interval(Duration::from_millis(sync_interval));
        }
        _ => {}
    }

    match db_builder.build().await {
        Ok(db) => {
            let db_id = Uuid::new_v4().to_string();

            DATABASE_REGISTRY.lock().await.insert(db_id.clone(), db);

            return CreateDbResponse {
                success: true,
                db_id: Some(db_id),
            };
        }
        Err(e) => {
            log::warn!("{e}");
            CreateDbResponse {
                success: false,
                db_id: Some(e.to_string()),
            }
        }
    }
}

pub struct SyncDbRequest {
    pub db_id: String,
}

pub struct SyncDbResponse {
    pub success: bool,
}

#[flutter_rust_bridge::frb(dart_async)]
pub async fn sync_db(request: SyncDbRequest) -> SyncDbResponse {
    return match DATABASE_REGISTRY.lock().await.get(&request.db_id) {
        Some(db) => match db.sync().await {
            Ok(_) => SyncDbResponse { success: true },
            Err(_) => SyncDbResponse { success: false },
        },
        _ => SyncDbResponse { success: false },
    };
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}
