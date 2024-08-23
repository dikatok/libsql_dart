use std::collections::HashMap;

pub enum LibsqlValue {
    Integer(i64),
    Real(f64),
    Text(String),
    Blob(Vec<u8>),
    Null,
}

pub struct LibsqlParams {
    pub positional: Option<Vec<LibsqlValue>>,
    pub named: Option<HashMap<String, LibsqlValue>>,
}

impl Into<libsql::params::Params> for LibsqlParams {
    fn into(self) -> libsql::params::Params {
        let positional_params = self
            .positional
            .as_ref()
            .map(|params| {
                params
                    .iter()
                    .map(|s| match &s {
                        LibsqlValue::Integer(i) => libsql::Value::Integer(*i),
                        LibsqlValue::Real(f) => libsql::Value::Real(*f),
                        LibsqlValue::Null => libsql::Value::Null,
                        LibsqlValue::Blob(b) => libsql::Value::Blob(b.to_vec()),
                        LibsqlValue::Text(t) => libsql::Value::Text(t.to_string()),
                    })
                    .collect::<Vec<_>>()
            })
            .unwrap_or_else(Vec::new);

        let named_params = self
            .named
            .as_ref()
            .map(|params| {
                params
                    .iter()
                    .map(|(k, v)| match &v {
                        LibsqlValue::Integer(i) => (k.clone(), libsql::Value::Integer(*i)),
                        LibsqlValue::Real(f) => (k.clone(), libsql::Value::Real(*f)),
                        LibsqlValue::Null => (k.clone(), libsql::Value::Null),
                        LibsqlValue::Blob(b) => (k.clone(), libsql::Value::Blob(b.to_vec())),
                        LibsqlValue::Text(t) => (k.clone(), libsql::Value::Text(t.to_string())),
                    })
                    .collect::<Vec<_>>()
            })
            .unwrap_or_else(Vec::new);

        match (positional_params.is_empty(), named_params.is_empty()) {
            (false, true) => libsql::params::Params::Positional(positional_params),
            (true, false) => libsql::params::Params::Named(named_params),
            _ => libsql::params::Params::None,
        }
    }
}
