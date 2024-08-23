use super::libsql::TRANSACTION_REGISTRY;
use crate::utils::{
    helpers::rows_to_query_result,
    params::LibsqlParams,
    result::{ExecuteResult, QueryResult, TransactionCommitResult, TransactionRollbackResult},
};

pub struct LibsqlTransaction {
    pub transaction_id: String,
}

impl LibsqlTransaction {
    pub async fn query(&self, sql: String, parameters: Option<LibsqlParams>) -> QueryResult {
        match TRANSACTION_REGISTRY.lock().await.get(&self.transaction_id) {
            Some(transaction) => {
                let params: libsql::params::Params = if let Some(p) = parameters {
                    p.into()
                } else {
                    libsql::params::Params::None
                };

                match transaction.query(&sql, params).await {
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

    pub async fn execute(&self, sql: String, parameters: Option<LibsqlParams>) -> ExecuteResult {
        match TRANSACTION_REGISTRY.lock().await.get(&self.transaction_id) {
            Some(transaction) => {
                let params: libsql::params::Params = if let Some(p) = parameters {
                    p.into()
                } else {
                    libsql::params::Params::None
                };

                match transaction.execute(&sql, params).await {
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

    pub async fn commit(&self) -> TransactionCommitResult {
        match TRANSACTION_REGISTRY
            .lock()
            .await
            .remove(&self.transaction_id)
        {
            Some(transaction) => match transaction.commit().await {
                Ok(_) => TransactionCommitResult {
                    error_message: None,
                },
                Err(err) => TransactionCommitResult {
                    error_message: Some(err.to_string()),
                },
            },
            _ => TransactionCommitResult {
                error_message: Some("Transaction not found".to_string()),
            },
        }
    }

    pub async fn rollback(&self) -> TransactionRollbackResult {
        match TRANSACTION_REGISTRY
            .lock()
            .await
            .remove(&self.transaction_id)
        {
            Some(transaction) => match transaction.rollback().await {
                Ok(_) => TransactionRollbackResult {
                    error_message: None,
                },
                Err(err) => TransactionRollbackResult {
                    error_message: Some(err.to_string()),
                },
            },
            _ => TransactionRollbackResult {
                error_message: Some("Transaction not found".to_string()),
            },
        }
    }
}

pub enum LibsqlTransactionBehavior {
    Deferred,
    Immediate,
    Exclusive,
    ReadOnly,
}
