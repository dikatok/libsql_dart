use super::{
    libsql::{DATABASE_REGISTRY, STATEMENT_REGISTRY, TRANSACTION_REGISTRY},
    statement::LibsqlStatement,
    transaction::{LibsqlTransaction, LibsqlTransactionBehavior},
};
use crate::utils::{
    params::LibsqlParams,
    result::{
        BatchResult, ExecuteResult, PrepareResult, QueryResult, SyncResult, TransactionResult,
    },
};
pub use libsql::TransactionBehavior;
use uuid::Uuid;

pub struct LibsqlConnection {
    pub db_id: String,
}

impl LibsqlConnection {
    pub async fn sync(&self) -> SyncResult {
        let guard = DATABASE_REGISTRY.lock().await;
        let (db, _) = guard.get(&self.db_id).unwrap();
        db.sync().await.unwrap();
        SyncResult {}
    }

    pub async fn query(&self, sql: String, parameters: Option<LibsqlParams>) -> QueryResult {
        self.prepare(sql).await.statement.query(parameters).await
    }

    pub async fn execute(&self, sql: String, parameters: Option<LibsqlParams>) -> ExecuteResult {
        self.prepare(sql).await.statement.execute(parameters).await
    }

    pub async fn prepare(&self, sql: String) -> PrepareResult {
        let guard = DATABASE_REGISTRY.lock().await;
        let (_, conn) = guard.get(&self.db_id).unwrap();
        let statement = conn.prepare(&sql).await.unwrap();
        let statement_id = Uuid::new_v4().to_string();
        STATEMENT_REGISTRY
            .lock()
            .await
            .insert(statement_id.clone(), statement);
        PrepareResult {
            statement: LibsqlStatement { statement_id },
        }
    }

    pub async fn batch(&self, sql: String) -> BatchResult {
        let guard = DATABASE_REGISTRY.lock().await;
        let (_, conn) = guard.get(&self.db_id).unwrap();
        conn.execute_batch(&sql).await.unwrap();
        BatchResult {}
    }

    pub async fn transaction(
        &self,
        behavior: Option<LibsqlTransactionBehavior>,
    ) -> TransactionResult {
        let behavior_ = match behavior {
            Some(LibsqlTransactionBehavior::Deferred) => TransactionBehavior::Deferred,
            Some(LibsqlTransactionBehavior::Exclusive) => TransactionBehavior::Exclusive,
            Some(LibsqlTransactionBehavior::Immediate) => TransactionBehavior::Immediate,
            Some(LibsqlTransactionBehavior::ReadOnly) => TransactionBehavior::ReadOnly,
            _ => TransactionBehavior::Deferred,
        };

        let guard = DATABASE_REGISTRY.lock().await;
        let (_, conn) = guard.get(&self.db_id).unwrap();
        let transaction = conn.transaction_with_behavior(behavior_).await.unwrap();
        let transaction_id = Uuid::new_v4().to_string();
        TRANSACTION_REGISTRY
            .lock()
            .await
            .insert(transaction_id.clone(), transaction);
        TransactionResult {
            transaction: LibsqlTransaction { transaction_id },
        }
    }

    pub async fn close(&self) {
        DATABASE_REGISTRY.lock().await.remove(&self.db_id).unwrap();
    }
}
