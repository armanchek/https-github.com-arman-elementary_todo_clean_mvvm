import '../models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> toggleTask(String id);
}
