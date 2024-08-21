import 'dart:typed_data';

import 'package:libsql_dart/src/rust/utils/parameters.dart';

ParamValue toParamValue(dynamic value) {
  if (value is int) {
    return ParamValue.integer(value);
  }
  if (value is double) {
    return ParamValue.real(value);
  }
  if (value is String) {
    return ParamValue.text(value);
  }
  if (value is Uint8List) {
    return ParamValue.blob(value);
  }
  return const ParamValue.null_();
}
