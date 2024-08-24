use super::return_value::LibsqlReturnValue;
use crate::api::{
    connection::LibsqlConnection, statement::LibsqlStatement, transaction::LibsqlTransaction,
};
use std::collections::HashMap;

pub struct ConnectResult {
    pub connection: LibsqlConnection,
}

pub struct SyncResult {}

pub struct QueryResult {
    pub rows: Vec<HashMap<String, LibsqlReturnValue>>,
    pub columns: Vec<String>,
    pub rows_affected: u64,
    pub last_insert_rowid: i64,
}

pub struct ExecuteResult {
    pub rows_affected: u64,
}

pub struct PrepareResult {
    pub statement: LibsqlStatement,
}

pub struct BatchResult {}

pub struct TransactionResult {
    pub transaction: LibsqlTransaction,
}

pub struct TransactionCommitResult {}

pub struct TransactionRollbackResult {}
