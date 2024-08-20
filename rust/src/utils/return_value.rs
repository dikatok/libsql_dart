pub enum ReturnValue {
    Integer(i64),
    Real(f64),
    Text(String),
    Blob(Vec<u8>),
    Null,
}

impl From<libsql::Value> for ReturnValue {
    fn from(value: libsql::Value) -> Self {
        match value {
            libsql::Value::Integer(i) => ReturnValue::Integer(i),
            libsql::Value::Real(f) => ReturnValue::Real(f),
            libsql::Value::Text(t) => ReturnValue::Text(t),
            libsql::Value::Blob(b) => ReturnValue::Blob(b),
            libsql::Value::Null => ReturnValue::Null,
        }
    }
}
