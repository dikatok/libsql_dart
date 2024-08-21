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

  Future<libsql.StatementQueryResult> query({
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    return libsql.statementQuery(
      args: libsql.StatementQueryArgs(
        statementId: statementId,
        parameters: Parameters(
          named: named?.map((k, v) => MapEntry(k, toParamValue(v))),
          positional: positional?.map(toParamValue).toList(),
        ),
      ),
    );
  }

  Future<libsql.StatementExecuteResult> execute({
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    return libsql.statementExecute(
      args: libsql.StatementExecuteArgs(
        statementId: statementId,
        parameters: Parameters(
          named: named?.map((k, v) => MapEntry(k, toParamValue(v))),
          positional: positional?.map(toParamValue).toList(),
        ),
      ),
    );
  }
}
