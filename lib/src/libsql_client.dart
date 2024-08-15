import 'package:libsql_dart/src/rust/api/libsql.dart' as libsql;
import 'package:libsql_dart/src/rust/frb_generated.dart';

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
}
