import 'package:libsql_dart_example/features/task/models/models.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();

  Future<void> addTask(Task task);

  Future<void> deleteTask(int id);

  Future<void> markTasksAsCompleted(List<int> ids);
}
