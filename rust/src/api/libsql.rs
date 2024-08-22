use async_std::sync::Mutex;
use libsql::{Builder, Connection, Database, Result, Statement};
use std::{collections::HashMap, time::Duration};
use uuid::Uuid;
extern crate lazy_static;
use crate::utils::{parameters::Parameters, return_value::ReturnValue};

lazy_static::lazy_static! {
   pub static ref DATABASE_REGISTRY: Mutex<HashMap<String, (Database,  Connection)>> = Mutex::new(HashMap::new());
   pub static ref STATEMENT_REGISTRY: Mutex<HashMap<String, Statement>> = Mutex::new(HashMap::new());
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
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

pub struct QueryArgs {
    pub db_id: String,
    pub sql: String,
    pub parameters: Option<Parameters>,
}

pub struct QueryResult {
    pub rows: Vec<HashMap<String, ReturnValue>>,
    pub rows_affected: u64,
    pub last_insert_rowid: i64,
    pub error_message: Option<String>,
}

pub async fn query(args: QueryArgs) -> QueryResult {
    return match DATABASE_REGISTRY.lock().await.get(&args.db_id) {
        Some((_, conn)) => {
            let params: libsql::params::Params = if let Some(p) = args.parameters {
                p.into()
            } else {
                libsql::params::Params::None
            };

            match conn.query(&args.sql, params).await {
                Ok(mut result) => {
                    let mut rows: Vec<HashMap<String, ReturnValue>> = Vec::new();
                    while let Ok(Some(result_row)) = result.next().await {
                        let mut row = HashMap::new();
                        for idx in 0..result_row.column_count() as i32 {
                            let column_name = result_row.column_name(idx).unwrap();
                            let value = result_row.get_value(idx).unwrap().into();
                            row.insert(column_name.to_string(), value);
                        }
                        rows.push(row);
                    }
                    QueryResult {
                        rows,
                        rows_affected: conn.changes(),
                        last_insert_rowid: conn.last_insert_rowid(),
                        error_message: None,
                    }
                }
                Err(err) => QueryResult {
                    rows: vec![],
                    rows_affected: 0,
                    last_insert_rowid: 0,
                    error_message: Some(err.to_string()),
                },
            }
        }
        _ => QueryResult {
            rows: vec![],
            rows_affected: 0,
            last_insert_rowid: 0,
            error_message: Some("DB is not initialized".to_string()),
        },
    };
}

pub struct ExecuteArgs {
    pub db_id: String,
    pub sql: String,
    pub parameters: Option<Parameters>,
}

pub struct ExecuteResult {
    pub rows_affected: u64,
    pub error_message: Option<String>,
}

pub async fn execute(args: ExecuteArgs) -> ExecuteResult {
    return match DATABASE_REGISTRY.lock().await.get(&args.db_id) {
        Some((_, conn)) => {
            let params = if let Some(p) = args.parameters {
                p.into()
            } else {
                libsql::params::Params::None
            };

            match conn.execute(&args.sql, params).await {
                Ok(result) => ExecuteResult {
                    rows_affected: result,
                    error_message: None,
                },
                Err(err) => ExecuteResult {
                    rows_affected: 0,
                    error_message: Some(err.to_string()),
                },
            }
        }
        _ => ExecuteResult {
            rows_affected: 0,
            error_message: Some("DB is not initialized".to_string()),
        },
    };
}

pub struct PrepareArgs {
    pub db_id: String,
    pub sql: String,
}

pub struct PrepareResult {
    pub statement_id: Option<String>,
    pub error_message: Option<String>,
}

pub async fn prepare(args: PrepareArgs) -> PrepareResult {
    return match DATABASE_REGISTRY.lock().await.get(&args.db_id) {
        Some((_, conn)) => match conn.prepare(&args.sql).await {
            Ok(statement) => {
                let statement_id = Uuid::new_v4().to_string();
                STATEMENT_REGISTRY
                    .lock()
                    .await
                    .insert(statement_id.clone(), statement);
                PrepareResult {
                    statement_id: Some(statement_id),
                    error_message: None,
                }
            }
            Err(err) => PrepareResult {
                statement_id: None,
                error_message: Some(err.to_string()),
            },
        },
        _ => PrepareResult {
            statement_id: None,
            error_message: Some("DB is not initialized".to_string()),
        },
    };
}

pub async fn statement_finalize(statement_id: String) {
    match STATEMENT_REGISTRY.lock().await.remove(&statement_id) {
        Some(mut statement) => statement.finalize(),
        _ => {}
    };
}

pub async fn statement_reset(statement_id: String) {
    match STATEMENT_REGISTRY.lock().await.remove(&statement_id) {
        Some(mut statement) => statement.reset(),
        _ => {}
    };
}

pub struct StatementQueryArgs {
    pub statement_id: String,
    pub parameters: Option<Parameters>,
}

pub struct StatementQueryResult {
    pub rows: Vec<HashMap<String, ReturnValue>>,
    pub rows_affected: u64,
    pub last_insert_rowid: i64,
    pub error_message: Option<String>,
}

pub async fn statement_query(args: StatementQueryArgs) -> StatementQueryResult {
    match STATEMENT_REGISTRY.lock().await.remove(&args.statement_id) {
        Some(mut statement) => {
            let params: libsql::params::Params = if let Some(p) = args.parameters {
                p.into()
            } else {
                libsql::params::Params::None
            };

            match statement.query(params).await {
                Ok(mut result) => {
                    let mut rows: Vec<HashMap<String, ReturnValue>> = Vec::new();
                    while let Ok(Some(result_row)) = result.next().await {
                        let mut row = HashMap::new();
                        for idx in 0..result_row.column_count() as i32 {
                            let column_name = result_row.column_name(idx).unwrap();
                            let value = result_row.get_value(idx).unwrap().into();
                            row.insert(column_name.to_string(), value);
                        }
                        rows.push(row);
                    }
                    StatementQueryResult {
                        rows,
                        rows_affected: 0,
                        last_insert_rowid: 0,
                        error_message: None,
                    }
                }
                Err(err) => StatementQueryResult {
                    rows: vec![],
                    rows_affected: 0,
                    last_insert_rowid: 0,
                    error_message: Some(err.to_string()),
                },
            }
        }
        _ => StatementQueryResult {
            rows: vec![],
            rows_affected: 0,
            last_insert_rowid: 0,
            error_message: Some("Statement not found".to_string()),
        },
    }
}

pub struct StatementExecuteArgs {
    pub statement_id: String,
    pub parameters: Option<Parameters>,
}

pub struct StatementExecuteResult {
    pub rows_affected: u64,
    pub error_message: Option<String>,
}

pub async fn statement_execute(args: StatementExecuteArgs) -> StatementExecuteResult {
    match STATEMENT_REGISTRY.lock().await.remove(&args.statement_id) {
        Some(mut statement) => {
            let params: libsql::params::Params = if let Some(p) = args.parameters {
                p.into()
            } else {
                libsql::params::Params::None
            };

            match statement.execute(params).await {
                Ok(result) => StatementExecuteResult {
                    rows_affected: result as u64,
                    error_message: None,
                },
                Err(err) => StatementExecuteResult {
                    rows_affected: 0,
                    error_message: Some(err.to_string()),
                },
            }
        }
        _ => StatementExecuteResult {
            rows_affected: 0,
            error_message: Some("Statement not found".to_string()),
        },
    }
}
pub struct BatchArgs {
    pub db_id: String,
    pub sql: String,
}

pub struct BatchResult {
    pub error_message: Option<String>,
}

pub async fn batch(args: BatchArgs) -> BatchResult {
    return match DATABASE_REGISTRY.lock().await.get(&args.db_id) {
        Some((_, conn)) => match conn.execute_batch(&args.sql).await {
            Ok(_) => BatchResult {
                error_message: None,
            },
            Err(err) => BatchResult {
                error_message: Some(err.to_string()),
            },
        },
        _ => BatchResult {
            error_message: Some("DB is not initialized".to_string()),
        },
    };
}
