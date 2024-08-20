import 'dart:typed_data';

import 'package:libsql_dart/src/rust/api/libsql.dart' as libsql;
import 'package:libsql_dart/src/rust/frb_generated.dart';
import 'package:libsql_dart/src/rust/utils/parameters.dart';

export 'package:libsql_dart/src/rust/api/libsql.dart' show LibsqlOpenFlags;

class LibsqlClient {
  LibsqlClient(
    this.url, {
    this.authToken,
    this.syncUrl,
    this.syncIntervalSeconds,
    this.encryptionKey,
    this.readYourWrites,
    this.openFlags,
  });

  final String url;
  String? authToken;
  String? syncUrl;
  int? syncIntervalSeconds;
  String? encryptionKey;
  bool? readYourWrites;
  libsql.LibsqlOpenFlags? openFlags;

  String? _dbId;

  Future<void> connect() async {
    if (!RustLib.instance.initialized) {
      await RustLib.init();
    }
    final res = await libsql.connect(
      args: libsql.ConnectArgs(
        url: url,
        authToken: authToken,
        syncUrl: syncUrl,
        syncIntervalSeconds: syncIntervalSeconds == null
            ? null
            : BigInt.from(syncIntervalSeconds!),
        encryptionKey: encryptionKey,
        readYourWrites: readYourWrites,
        openFlags: openFlags,
      ),
    );
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
    _dbId = res.dbId;
  }

  Future<void> sync() async {
    if (_dbId == null) throw Exception('Database is not connected');
    final res = await libsql.sync(args: libsql.SyncArgs(dbId: _dbId!));
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
  }

  Future<List<Map<String, dynamic>>> query(
    String sql, {
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    if (_dbId == null) throw Exception('Database is not connected');
    final res = await libsql.query(
      args: libsql.QueryArgs(
        dbId: _dbId!,
        sql: sql,
        parameters: Parameters(
          named: named?.map((k, v) => MapEntry(k, _toParamValue(v))),
          positional: positional?.map(_toParamValue).toList(),
        ),
      ),
    );
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
    return res.rows
        .map(
          (row) => Map.fromEntries(
            row.entries.map(
              (entry) => MapEntry(
                entry.key,
                entry.value.mapOrNull(
                  integer: (integer) => integer.field0,
                  real: (real) => real.field0,
                  text: (text) => text.field0,
                  blob: (blob) => blob.field0,
                  null_: (_) => null,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  Future<int> execute(
    String sql, {
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    if (_dbId == null) throw Exception('Database is not connected');
    final res = await libsql.execute(
      args: libsql.ExecuteArgs(
        dbId: _dbId!,
        sql: sql,
        parameters: Parameters(
          named: named?.map((k, v) => MapEntry(k, _toParamValue(v))),
          positional: positional?.map(_toParamValue).toList(),
        ),
      ),
    );
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
    return res.rowsAffected.toInt();
  }

  ParamValue _toParamValue(dynamic value) {
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
}
