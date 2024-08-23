use super::libsql::STATEMENT_REGISTRY;
use crate::utils::{
    helpers::rows_to_query_result,
    parameters::Parameters,
    result::{ExecuteResult, QueryResult},
};

pub struct LibsqlStatement {
    pub statement_id: String,
}

impl LibsqlStatement {
    pub async fn finalize(&self) {
        match STATEMENT_REGISTRY.lock().await.remove(&self.statement_id) {
            Some(mut statement) => statement.finalize(),
            _ => {}
        };
    }

    pub async fn reset(&self) {
        match STATEMENT_REGISTRY.lock().await.remove(&self.statement_id) {
            Some(mut statement) => statement.reset(),
            _ => {}
        };
    }

    pub async fn query(&self, parameters: Option<Parameters>) -> QueryResult {
        match STATEMENT_REGISTRY.lock().await.remove(&self.statement_id) {
            Some(mut statement) => {
                let params: libsql::params::Params = if let Some(p) = parameters {
                    p.into()
                } else {
                    libsql::params::Params::None
                };

                match statement.query(params).await {
                    Ok(result) => rows_to_query_result(result).await,
                    Err(err) => QueryResult {
                        rows: vec![],
                        columns: vec![],
                        rows_affected: 0,
                        last_insert_rowid: 0,
                        error_message: Some(err.to_string()),
                    },
                }
            }
            _ => QueryResult {
                rows: vec![],
                columns: vec![],
                rows_affected: 0,
                last_insert_rowid: 0,
                error_message: Some("Statement not found".to_string()),
            },
        }
    }

    pub async fn execute(&self, parameters: Option<Parameters>) -> ExecuteResult {
        match STATEMENT_REGISTRY.lock().await.remove(&self.statement_id) {
            Some(mut statement) => {
                let params: libsql::params::Params = if let Some(p) = parameters {
                    p.into()
                } else {
                    libsql::params::Params::None
                };

                match statement.execute(params).await {
                    Ok(result) => ExecuteResult {
                        rows_affected: result as u64,
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
                error_message: Some("Statement not found".to_string()),
            },
        }
    }
}
