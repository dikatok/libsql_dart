import 'package:libsql_dart/src/helpers.dart';
import 'package:libsql_dart/src/rust/api/libsql.dart' as libsql;
import 'package:libsql_dart/src/rust/utils/parameters.dart';

class LibSQLStatement {
  LibSQLStatement(this.statementId);

  final String statementId;

  Future<void> finalize() async {
    libsql.statementFinalize(statementId: statementId);
  }

  Future<void> reset() async {
    libsql.statementReset(statementId: statementId);
  }

  Future<List<Map<String, dynamic>>> query({
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    final res = await libsql.statementQuery(
      args: libsql.StatementQueryArgs(
        statementId: statementId,
        parameters: Parameters(
          named: named?.map((k, v) => MapEntry(k, toParamValue(v))),
          positional: positional?.map(toParamValue).toList(),
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

  Future<int> execute({
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    final res = await libsql.statementExecute(
      args: libsql.StatementExecuteArgs(
        statementId: statementId,
        parameters: Parameters(
          named: named?.map((k, v) => MapEntry(k, toParamValue(v))),
          positional: positional?.map(toParamValue).toList(),
        ),
      ),
    );
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
    return res.rowsAffected.toInt();
  }
}
