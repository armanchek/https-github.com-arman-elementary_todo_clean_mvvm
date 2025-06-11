import 'package:uuid/uuid.dart';
import '../../domain/models/task.dart';

class LocalTaskDataSource {
  final List<Task> _tasks = [];

  List<Task> getTasks() => _tasks;

  void addTask(String title) {
    _tasks.add(Task(id: Uuid().v4(), title: title));
  }

  void toggleTask(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(isDone: !_tasks[index].isDone);
    }
  }
}
