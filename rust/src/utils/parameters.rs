use std::collections::HashMap;

pub enum ParamValue {
    Integer(i64),
    Real(f64),
    Text(String),
    Blob(Vec<u8>),
    Null,
}

pub struct Parameters {
    pub positional: Option<Vec<ParamValue>>,
    pub named: Option<HashMap<String, ParamValue>>,
}

impl Into<libsql::params::Params> for Parameters {
    fn into(self) -> libsql::params::Params {
        let positional_params = self
            .positional
            .as_ref()
            .map(|params| {
                params
                    .iter()
                    .map(|s| match &s {
                        ParamValue::Integer(i) => libsql::Value::Integer(*i),
                        ParamValue::Real(f) => libsql::Value::Real(*f),
                        ParamValue::Null => libsql::Value::Null,
                        ParamValue::Blob(b) => libsql::Value::Blob(b.to_vec()),
                        ParamValue::Text(t) => libsql::Value::Text(t.to_string()),
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
                        ParamValue::Integer(i) => (k.clone(), libsql::Value::Integer(*i)),
                        ParamValue::Real(f) => (k.clone(), libsql::Value::Real(*f)),
                        ParamValue::Null => (k.clone(), libsql::Value::Null),
                        ParamValue::Blob(b) => (k.clone(), libsql::Value::Blob(b.to_vec())),
                        ParamValue::Text(t) => (k.clone(), libsql::Value::Text(t.to_string())),
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
