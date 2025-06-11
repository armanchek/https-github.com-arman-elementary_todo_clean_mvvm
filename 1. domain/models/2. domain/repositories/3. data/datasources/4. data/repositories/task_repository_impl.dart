import '../../domain/models/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/local_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalTaskDataSource dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  Future<List<Task>> getTasks() async => dataSource.getTasks();

  @override
  Future<void> addTask(Task task) async => dataSource.addTask(task.title);

  @override
  Future<void> toggleTask(String id) async => dataSource.toggleTask(id);
}
