import 'package:libsql_dart/src/rust/api/libsql.dart';
import 'package:libsql_dart/src/rust/frb_generated.dart';

class LibsqlClient {
  LibsqlClient({
    required this.replicaPath,
    required this.syncUrl,
    required this.syncToken,
    this.syncIntervalMilliseconds,
  });

  final String replicaPath;
  final String syncUrl;
  final String syncToken;
  final int? syncIntervalMilliseconds;

  String? dbId;

  static Future<void> init() async {
    return RustLib.init();
  }

  Future<void> create() async {
    final res = await createDb(
      request: CreateDbRequest(
        replicaPath: replicaPath,
        syncUrl: syncUrl,
        syncToken: syncToken,
        syncIntervalMilliseconds: syncIntervalMilliseconds == null
            ? null
            : BigInt.from(syncIntervalMilliseconds!),
      ),
    );
    if (!res.success) throw Exception('Failed to create db');
    dbId = res.dbId;
  }

  Future<void> sync() async {
    if (dbId == null) throw Exception('Db not created');
    final res = await syncDb(request: SyncDbRequest(dbId: dbId!));
    if (!res.success) throw Exception('Failed to sync');
  }
}
