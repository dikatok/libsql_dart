import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libsql_dart_example/features/task/blocs/task_list_state.dart';
import 'package:libsql_dart_example/features/task/models/models.dart';
import 'package:libsql_dart_example/features/task/repositories/repositories.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final TaskRepository _taskRepository;

  TaskListCubit(this._taskRepository) : super(TaskListInitial()) {
    getTasks();
  }

  Future<void> getTasks() async {
    emit(TaskListLoading());
    try {
      final tasks = await _taskRepository.getTasks();
      emit(TaskListLoaded(tasks));
    } catch (e) {
      emit(TaskListError(e.toString()));
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _taskRepository.addTask(task);
      await getTasks();
    } catch (e) {
      emit(TaskListError(e.toString()));
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await _taskRepository.deleteTask(id);
      await getTasks();
    } catch (e) {
      emit(TaskListError(e.toString()));
    }
  }

  Future<void> markTasksAsCompleted(List<int> ids) async {
    try {
      await _taskRepository.markTasksAsCompleted(ids);
      await getTasks();
    } catch (e) {
      emit(TaskListError(e.toString()));
    }
  }
}
