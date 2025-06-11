import 'package:elementary/elementary.dart';
import '../../domain/models/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskViewModel extends ElementaryModel {
  final TaskRepository repository;

  TaskViewModel(this.repository);

  final ValueNotifier<List<Task>> tasks = ValueNotifier([]);

  Future<void> loadTasks() async {
    tasks.value = await repository.getTasks();
  }

  Future<void> addTask(String title) async {
    await repository.addTask(Task(id: '', title: title));
    await loadTasks();
  }

  Future<void> toggleTask(String id) async {
    await repository.toggleTask(id);
    await loadTasks();
  }
}
