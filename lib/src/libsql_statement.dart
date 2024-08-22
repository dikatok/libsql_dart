import 'package:libsql_dart/src/helpers.dart';
import 'package:libsql_dart/src/rust/api/api.dart';
import 'package:libsql_dart/src/rust/utils/parameters.dart';

// This is for internal only
class Statement {
  Statement(this.statement);

  final LibsqlStatement statement;

  // Finalize statement
  Future<void> finalize() async {
    statement.finalize();
  }

  // Reset statement
  Future<void> reset() async {
    statement.reset();
  }

  /// Query the statement, you can provide either named or positional parameters
  ///
  /// # Args
  /// * `named` - Named parameters
  /// * `positional` - Positional parameters
  ///
  /// # Returns
  /// Returns a list of object, eg: [{'id': 1, 'name': 'John'}, {'id': 2, 'name': 'Jane'}]
  Future<List<Map<String, dynamic>>> query({
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    final res = await statement.query(
      parameters: Parameters(
        named: named?.map((k, v) => MapEntry(k, toParamValue(v))),
        positional: positional?.map(toParamValue).toList(),
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

  /// Execute the statement, you can provide either named or positional parameters
  ///
  /// # Args
  /// * `sql` - SQL query
  /// * `named` - Named parameters
  /// * `positional` - Positional parameters
  ///
  /// # Returns
  /// Number of rows affected by the statement
  Future<int> execute({
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    final res = await statement.execute(
      parameters: Parameters(
        named: named?.map((k, v) => MapEntry(k, toParamValue(v))),
        positional: positional?.map(toParamValue).toList(),
      ),
    );
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
    return res.rowsAffected.toInt();
  }
}
