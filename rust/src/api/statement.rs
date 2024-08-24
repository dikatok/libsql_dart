use super::libsql::STATEMENT_REGISTRY;
use crate::utils::{
    helpers::rows_to_query_result,
    params::LibsqlParams,
    result::{ExecuteResult, QueryResult},
};

pub struct LibsqlStatement {
    pub statement_id: String,
}

impl LibsqlStatement {
    pub async fn finalize(&self) {
        STATEMENT_REGISTRY
            .lock()
            .await
            .remove(&self.statement_id)
            .unwrap()
            .finalize();
    }

    pub async fn reset(&self) {
        STATEMENT_REGISTRY
            .lock()
            .await
            .remove(&self.statement_id)
            .unwrap()
            .reset();
    }

    pub async fn query(&self, parameters: Option<LibsqlParams>) -> QueryResult {
        let params: libsql::params::Params = parameters
            .unwrap_or(LibsqlParams {
                positional: None,
                named: None,
            })
            .into();
        let result = STATEMENT_REGISTRY
            .lock()
            .await
            .remove(&self.statement_id)
            .unwrap()
            .query(params)
            .await
            .unwrap();
        rows_to_query_result(result).await
    }

    pub async fn execute(&self, parameters: Option<LibsqlParams>) -> ExecuteResult {
        let params: libsql::params::Params = parameters
            .unwrap_or(LibsqlParams {
                positional: None,
                named: None,
            })
            .into();
        let rows_affected = STATEMENT_REGISTRY
            .lock()
            .await
            .remove(&self.statement_id)
            .unwrap()
            .execute(params)
            .await
            .unwrap() as u64;
        ExecuteResult { rows_affected }
    }
}
