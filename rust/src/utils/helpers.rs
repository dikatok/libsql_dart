use std::collections::HashMap;

use libsql::Rows;

use super::{result::QueryResult, return_value::LibsqlReturnValue};

pub async fn rows_to_query_result(mut result: Rows) -> QueryResult {
    let mut rows: Vec<HashMap<String, LibsqlReturnValue>> = Vec::new();
    while let Ok(Some(result_row)) = result.next().await {
        let mut row = HashMap::new();
        for idx in 0..result_row.column_count() as i32 {
            let column_name = result_row.column_name(idx).unwrap();
            let value = result_row.get_value(idx).unwrap().into();
            row.insert(column_name.to_string(), value);
        }
        rows.push(row);
    }
    let mut columns: Vec<String> = Vec::new();
    for idx in 0..result.column_count() as i32 {
        columns.push(result.column_name(idx).unwrap().to_string());
    }
    QueryResult {
        rows,
        columns,
        rows_affected: 0,
        last_insert_rowid: 0,
    }
}
