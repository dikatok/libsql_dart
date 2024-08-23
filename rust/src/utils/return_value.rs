pub enum LibsqlReturnValue {
    Integer(i64),
    Real(f64),
    Text(String),
    Blob(Vec<u8>),
    Null,
}

impl From<libsql::Value> for LibsqlReturnValue {
    fn from(value: libsql::Value) -> Self {
        match value {
            libsql::Value::Integer(i) => LibsqlReturnValue::Integer(i),
            libsql::Value::Real(f) => LibsqlReturnValue::Real(f),
            libsql::Value::Text(t) => LibsqlReturnValue::Text(t),
            libsql::Value::Blob(b) => LibsqlReturnValue::Blob(b),
            libsql::Value::Null => LibsqlReturnValue::Null,
        }
    }
}
