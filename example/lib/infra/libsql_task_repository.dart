import 'package:libsql_dart/libsql_dart.dart';
import 'package:libsql_dart_example/features/task/models/task.dart';
import 'package:libsql_dart_example/features/task/repositories/repositories.dart';

class LibsqlTaskRepository extends TaskRepository {
  final LibsqlClient _client;

  LibsqlTaskRepository(this._client);

  @override
  Future<void> addTask(Task task) async {
    await _client.execute(
        "insert into tasks (title, description, completed) values (?, ?, ?)",
        positional: [task.title, task.description, task.completed ? 1 : 0]);
  }

  @override
  Future<void> deleteTask(int id) async {
    await _client.execute("delete from tasks where id = ?", positional: [id]);
  }

  @override
  Future<List<Task>> getTasks() async {
    return _client.query("select * from tasks").then((value) => value
        .map((row) => Task(
              id: row["id"],
              title: row["title"],
              description: row["description"],
              completed: row["completed"] == 1,
            ))
        .toList());
  }

  @override
  Future<void> markTasksAsCompleted(List<int> ids) async {
    await _client.execute(
      "update tasks set completed = 1 where id in (${ids.join(",")})",
    );
  }
}
