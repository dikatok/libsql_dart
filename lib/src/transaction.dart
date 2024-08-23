import 'package:libsql_dart/src/helpers.dart';
import 'package:libsql_dart/src/rust/api/transaction.dart';
import 'package:libsql_dart/src/rust/utils/params.dart';

class Transaction {
  Transaction(this.transaction);

  final LibsqlTransaction transaction;

  Future<List<Map<String, dynamic>>> query(
    String sql, {
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    final res = await transaction.query(
      sql: sql,
      parameters: LibsqlParams(
        named: named?.map((k, v) => MapEntry(k, toLibsqlValue(v))),
        positional: positional?.map(toLibsqlValue).toList(),
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
    final res = await transaction.execute(
      sql: sql,
      parameters: LibsqlParams(
        named: named?.map((k, v) => MapEntry(k, toLibsqlValue(v))),
        positional: positional?.map(toLibsqlValue).toList(),
      ),
    );
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
    return res.rowsAffected.toInt();
  }

  Future<void> commit() async {
    final res = await transaction.commit();
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
  }

  Future<void> rollback() async {
    final res = await transaction.rollback();
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
  }
}
