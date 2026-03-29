import 'package:flutter/material.dart';
import 'package:libsql_dart/libsql_dart.dart';
import 'package:libsql_dart_example/bootstrap.dart';
import 'package:libsql_dart_example/features/task/repositories/task_repository.dart';
import 'package:libsql_dart_example/features/task/task_list.dart';
import 'package:libsql_dart_example/infra/libsql_task_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

const url = String.fromEnvironment("TURSO_URL");
const token = String.fromEnvironment("TURSO_TOKEN");
const offlineUrl = String.fromEnvironment("TURSO_OFFLINE_URL");
const offlineToken = String.fromEnvironment("TURSO_OFFLINE_TOKEN");
const doTestExtension = false;

late LibsqlClient memoryClient;
late LibsqlClient localClient;
late LibsqlClient remoteClient;
late LibsqlClient replicaClient;
late LibsqlClient offlineClient;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationCacheDirectory();
  await dir.delete(recursive: true);
  await dir.create(recursive: true);

  // memoryClient = LibsqlClient(":memory:");
  memoryClient = LibsqlClient.memory();

  // localClient = LibsqlClient("${dir.path}/local.db");
  localClient = LibsqlClient.local("${dir.path}/local.db");

  // remoteClient = LibsqlClient(url, authToken: token);
  remoteClient = LibsqlClient.remote(url, authToken: token);

  // replicaClient = LibsqlClient(
  //   "${dir.path}/replica.db",
  //   syncUrl: url,
  //   authToken: token,
  //   readYourWrites: true,
  //   syncIntervalSeconds: 3,
  // );
  replicaClient = LibsqlClient.replica(
    "${dir.path}/replica.db",
    syncUrl: url,
    authToken: token,
    readYourWrites: true,
    syncIntervalSeconds: 3,
  );

  // offlineClient = LibsqlClient(
  //   "${dir.path}/offline.db",
  //   syncUrl: url,
  //   authToken: token,
  //   offline: true,
  // );
  offlineClient = LibsqlClient.offline(
    "${dir.path}/offline.db",
    syncUrl: offlineUrl,
    authToken: offlineToken,
  );

  await bootstrapDatabase(memoryClient);
  await bootstrapDatabase(localClient);
  // await bootstrapDatabase(remoteClient);
  // await bootstrapDatabase(replicaClient, sync: true);
  // await bootstrapDatabase(offlineClient, sync: true);

  if (doTestExtension) {
    final extensionTestClient = LibsqlClient("${dir.path}/extension.db");
    await runExtensionTest(extensionTestClient);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Libsql Dart Example')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Builder(builder: (context) {
            return Center(
              child: Column(
                spacing: 16,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Provider<TaskRepository>(
                            create: (context) =>
                                LibsqlTaskRepository(memoryClient),
                            child: const TaskList(),
                          ),
                        ),
                      );
                    },
                    child: const Text("Memory"),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Provider<TaskRepository>(
                            create: (context) =>
                                LibsqlTaskRepository(localClient),
                            child: const TaskList(),
                          ),
                        ),
                      );
                    },
                    child: const Text("Local"),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Provider<TaskRepository>(
                            create: (context) =>
                                LibsqlTaskRepository(remoteClient),
                            child: const TaskList(),
                          ),
                        ),
                      );
                    },
                    child: const Text("Remote"),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Provider<TaskRepository>(
                            create: (context) =>
                                LibsqlTaskRepository(replicaClient),
                            child: const TaskList(),
                          ),
                        ),
                      );
                    },
                    child: const Text("Replica"),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Provider<TaskRepository>(
                            create: (context) =>
                                LibsqlTaskRepository(offlineClient),
                            child: const TaskList(syncOnNetworkChange: true),
                          ),
                        ),
                      );
                    },
                    child: const Text("Offline"),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
