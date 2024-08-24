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
        let params: libsql::params::Params = parameters
            .unwrap_or(LibsqlParams {
                positional: None,
                named: None,
            })
            .into();
        let result = TRANSACTION_REGISTRY
            .lock()
            .await
            .get(&self.transaction_id)
            .unwrap()
            .query(&sql, params)
            .await
            .unwrap();
        rows_to_query_result(result).await
    }

    pub async fn execute(&self, sql: String, parameters: Option<LibsqlParams>) -> ExecuteResult {
        let params: libsql::params::Params = parameters
            .unwrap_or(LibsqlParams {
                positional: None,
                named: None,
            })
            .into();
        let rows_affected = TRANSACTION_REGISTRY
            .lock()
            .await
            .get(&self.transaction_id)
            .unwrap()
            .execute(&sql, params)
            .await
            .unwrap();
        ExecuteResult { rows_affected }
    }

    pub async fn commit(&self) -> TransactionCommitResult {
        let transaction = TRANSACTION_REGISTRY
            .lock()
            .await
            .remove(&self.transaction_id)
            .unwrap();
        transaction.commit().await.unwrap();
        TransactionCommitResult {}
    }

    pub async fn rollback(&self) -> TransactionRollbackResult {
        let transaction = TRANSACTION_REGISTRY
            .lock()
            .await
            .remove(&self.transaction_id)
            .unwrap();
        transaction.rollback().await.unwrap();
        TransactionRollbackResult {}
    }
}

pub enum LibsqlTransactionBehavior {
    Deferred,
    Immediate,
    Exclusive,
    ReadOnly,
}
