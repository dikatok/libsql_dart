import 'package:libsql_dart/src/helpers.dart';
import 'package:libsql_dart/src/rust/api/api.dart' as libsql;
import 'package:libsql_dart/src/rust/api/api.dart';
import 'package:libsql_dart/src/rust/frb_generated.dart';
import 'package:libsql_dart/src/rust/utils/params.dart';
import 'package:libsql_dart/src/statement.dart';
import 'package:libsql_dart/src/transaction.dart';

/// A client class to interact with LibSQL/Turso database instance.
/// All variants of database types can be created using this class.
/// Below is supported configuration for each variants
///
/// # In memory database
/// ```dart
/// final client = LibsqlClient(':memory:');
/// await client.connect();
/// ```
///
/// # Local database
/// ```dart
/// final dir = await getApplicationCacheDirectory();
/// final path = '${dir.path}/local.db';
/// final client = LibsqlClient(path, openFlags: libsql.LibsqlOpenFlags.readWrite);
/// await client.connect();
/// ```
///
/// # Remote database
/// ```dart
/// final client = LibsqlClient('<TURSO_OR_LIBSQL_URL>', authToken: '<TOKEN>');
/// await client.connect();
/// ```
///
/// # Embedded replica
/// ```dart
/// final dir = await getApplicationCacheDirectory();
/// final path = '${dir.path}/replica.db';
/// final client = LibsqlClient(path, syncUrl: '<TURSO_OR_LIBSQL_URL>', authToken: '<TOKEN>', readYourWrites: true, syncIntervalSeconds: 30);
/// await client.connect();
/// ```
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

  // :memory:, <LOCAL_PATH>, libsql://<URL>, http://<URL>, or https://<URL>
  final String url;
  // Auth token for remote or embedded replica
  String? authToken;
  // Must be provided when using embedded replica
  String? syncUrl;
  // Sync interval in seconds when using embedded replica
  int? syncIntervalSeconds;
  String? encryptionKey;
  // Ensure embedded replica is updated after each write
  bool? readYourWrites;
  // Open flags for local database only
  LibsqlOpenFlags? openFlags;

  LibsqlConnection? _connection;

  /// Connect the database, must be called first after creation
  Future<void> connect() async {
    if (!RustLib.instance.initialized) {
      await RustLib.init();
    }
    final res = await libsql.connect(
      args: ConnectArgs(
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
    _connection = res.connection;
  }

  // Sync the embedded replica
  Future<void> sync() async {
    if (_connection == null) throw Exception('Database is not connected');
    final res = await _connection!.sync_();
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
  }

  /// Query the database, you can provide either named or positional parameters
  ///
  /// # Args
  /// * `sql` - SQL query
  /// * `named` - Named parameters
  /// * `positional` - Positional parameters
  ///
  /// # Returns
  /// Returns a list of object, eg: [{'id': 1, 'name': 'John'}, {'id': 2, 'name': 'Jane'}]
  Future<List<Map<String, dynamic>>> query(
    String sql, {
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    if (_connection == null) throw Exception('Database is not connected');
    final res = await _connection!.query(
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

  /// Execute the statement, you can provide either named or positional parameters
  ///
  /// # Args
  /// * `sql` - SQL query
  /// * `named` - Named parameters
  /// * `positional` - Positional parameters
  ///
  /// # Returns
  /// Number of rows affected by the statement
  Future<int> execute(
    String sql, {
    Map<String, dynamic>? named,
    List<dynamic>? positional,
  }) async {
    if (_connection == null) throw Exception('Database is not connected');
    final res = await _connection!.execute(
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

  /// Create a prepared statement
  ///
  /// # Args
  /// * `sql` - SQL query
  ///
  /// # Returns
  /// Statement object
  Future<Statement> prepare(String sql) async {
    if (_connection == null) throw Exception('Database is not connected');
    final res = await _connection!.prepare(
      sql: sql,
    );
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
    return Statement(res.statement!);
  }

  /// Run a batch transaction
  ///
  /// # Args
  /// * `sql` - batch SQL query, each statement is separated by a semicolon
  Future<void> batch(String sql) async {
    if (_connection == null) throw Exception('Database is not connected');
    final res = await _connection!.batch(sql: sql);
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
  }

  Future<Transaction> transaction() async {
    if (_connection == null) throw Exception('Database is not connected');
    final res = await _connection!.transaction();
    if (res.errorMessage?.isNotEmpty ?? false) {
      throw Exception(res.errorMessage);
    }
    return Transaction(res.transaction!);
  }

  /// Close the database
  Future<void> dispose() async {
    _connection?.close();
  }
}
