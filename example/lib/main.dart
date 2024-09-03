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

late LibsqlClient memoryClient;
late LibsqlClient localClient;
late LibsqlClient remoteClient;
late LibsqlClient replicaClient;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationCacheDirectory();

  memoryClient = LibsqlClient(":memory:");
  localClient = LibsqlClient("${dir.path}/local.db");
  remoteClient = LibsqlClient(url, authToken: token);
  replicaClient = LibsqlClient(
    "${dir.path}/replica.db",
    syncUrl: url,
    authToken: token,
    readYourWrites: true,
    syncIntervalSeconds: 5,
  );

  await bootstrapDatabase(memoryClient);
  await bootstrapDatabase(localClient);
  await bootstrapDatabase(remoteClient);
  await bootstrapDatabase(replicaClient);

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
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
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
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
