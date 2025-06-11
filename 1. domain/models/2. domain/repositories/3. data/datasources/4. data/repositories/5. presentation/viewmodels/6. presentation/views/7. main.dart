import 'package:flutter/material.dart';
import 'data/datasources/local_data_source.dart';
import 'data/repositories/task_repository_impl.dart';
import 'presentation/viewmodels/task_vm.dart';
import 'presentation/views/task_list_view.dart';

void main() {
  final dataSource = LocalTaskDataSource();
  final repository = TaskRepositoryImpl(dataSource);
  final model = TaskViewModel(repository);

  runApp(MaterialApp(
    home: TaskListView(model: model),
  ));
}
