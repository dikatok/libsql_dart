use async_std::sync::Mutex;
use libsql::{Builder, Connection, Database, Result};
use std::{collections::HashMap, time::Duration};
use uuid::Uuid;

lazy_static::lazy_static! {
    static ref DATABASE_REGISTRY: Mutex<HashMap<String, (Database, Connection)>> = Mutex::new(HashMap::new());
}

pub enum LibsqlOpenFlags {
    ReadOnly,
    ReadWrite,
    Create,
}

pub struct ConnectArgs {
    pub url: String,
    pub auth_token: Option<String>,
    pub sync_url: Option<String>,
    pub sync_interval_seconds: Option<u64>,
    pub encryption_key: Option<String>,
    pub read_your_writes: Option<bool>,
    pub open_flags: Option<LibsqlOpenFlags>,
}

pub struct ConnectResult {
    pub error_message: Option<String>,
    pub db_id: Option<String>,
}

#[flutter_rust_bridge::frb(dart_async)]
pub async fn connect(args: ConnectArgs) -> ConnectResult {
    let database: Result<Database> = if let Some(sync_url) = args.sync_url {
        let connector = hyper_rustls::HttpsConnectorBuilder::new()
            .with_webpki_roots()
            .https_or_http()
            .enable_http1()
            .build();

        let mut builder = Builder::new_remote_replica(
            args.url,
            sync_url,
            args.auth_token.unwrap_or("".to_string()),
        )
        .connector(connector);

        if let Some(interval) = args.sync_interval_seconds {
            builder = builder.sync_interval(Duration::from_secs(interval))
        }

        if let Some(key) = args.encryption_key {
            builder = builder.encryption_config(libsql::EncryptionConfig::new(
                libsql::Cipher::Aes256Cbc,
                key.as_bytes().to_vec().into(),
            ));
        }

        builder = builder.read_your_writes(args.read_your_writes.or(Some(true)).unwrap());

        builder.build().await
    } else if args.url.starts_with("libsql://")
        || args.url.starts_with("http://")
        || args.url.starts_with("https://")
    {
        let connector = hyper_rustls::HttpsConnectorBuilder::new()
            .with_webpki_roots()
            .https_or_http()
            .enable_http1()
            .build();

        Builder::new_remote(args.url, args.auth_token.unwrap_or("".to_string()))
            .connector(connector)
            .build()
            .await
    } else {
        let mut builder = Builder::new_local(args.url).flags(match args.open_flags {
            Some(LibsqlOpenFlags::ReadOnly) => libsql::OpenFlags::SQLITE_OPEN_READ_ONLY,
            Some(LibsqlOpenFlags::ReadWrite) => libsql::OpenFlags::SQLITE_OPEN_READ_WRITE,
            Some(LibsqlOpenFlags::Create) => libsql::OpenFlags::SQLITE_OPEN_CREATE,
            None => libsql::OpenFlags::default(),
        });

        if let Some(key) = args.encryption_key {
            builder = builder.encryption_config(libsql::EncryptionConfig::new(
                libsql::Cipher::Aes256Cbc,
                key.as_bytes().to_vec().into(),
            ));
        }

        builder.build().await
    };

    match database {
        Ok(db) => {
            let conn = match db.connect() {
                Ok(conn) => conn,
                Err(err) => {
                    return ConnectResult {
                        error_message: Some(err.to_string()),
                        db_id: None,
                    }
                }
            };
            let db_id = Uuid::new_v4().to_string();
            DATABASE_REGISTRY
                .lock()
                .await
                .insert(db_id.clone(), (db, conn));
            ConnectResult {
                error_message: None,
                db_id: Some(db_id),
            }
        }
        Err(e) => ConnectResult {
            error_message: Some(e.to_string()),
            db_id: None,
        },
    }
}

pub struct SyncArgs {
    pub db_id: String,
}

pub struct SyncResult {
    pub error_message: Option<String>,
}

#[flutter_rust_bridge::frb(dart_async)]
pub async fn sync(args: SyncArgs) -> SyncResult {
    return match DATABASE_REGISTRY.lock().await.get(&args.db_id) {
        Some((db, _)) => match db.sync().await {
            Ok(_) => SyncResult {
                error_message: None,
            },
            Err(err) => SyncResult {
                error_message: Some(err.to_string()),
            },
        },
        _ => SyncResult {
            error_message: Some("DB is not initialized".to_string()),
        },
    };
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}
