import 'dart:typed_data';

import 'package:libsql_dart/src/rust/utils/params.dart';

LibsqlValue toLibsqlValue(dynamic value) {
  if (value is int) {
    return LibsqlValue.integer(value);
  }
  if (value is double) {
    return LibsqlValue.real(value);
  }
  if (value is String) {
    return LibsqlValue.text(value);
  }
  if (value is Uint8List) {
    return LibsqlValue.blob(value);
  }
  return const LibsqlValue.null_();
}
