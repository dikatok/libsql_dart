use super::return_value::LibsqlReturnValue;
use crate::api::{
    connection::LibsqlConnection, statement::LibsqlStatement, transaction::LibsqlTransaction,
};
use std::collections::HashMap;

pub struct ConnectResult {
    pub connection: Option<LibsqlConnection>,
    pub error_message: Option<String>,
}

pub struct SyncResult {
    pub error_message: Option<String>,
}

pub struct QueryResult {
    pub rows: Vec<HashMap<String, LibsqlReturnValue>>,
    pub columns: Vec<String>,
    pub rows_affected: u64,
    pub last_insert_rowid: i64,
    pub error_message: Option<String>,
}

pub struct ExecuteResult {
    pub rows_affected: u64,
    pub error_message: Option<String>,
}

pub struct PrepareResult {
    pub statement: Option<LibsqlStatement>,
    pub error_message: Option<String>,
}

pub struct BatchResult {
    pub error_message: Option<String>,
}

pub struct TransactionResult {
    pub transaction: Option<LibsqlTransaction>,
    pub error_message: Option<String>,
}

pub struct TransactionCommitResult {
    pub error_message: Option<String>,
}

pub struct TransactionRollbackResult {
    pub error_message: Option<String>,
}
