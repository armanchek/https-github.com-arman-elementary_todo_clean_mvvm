import 'package:flutter/material.dart';
import '../viewmodels/task_vm.dart';

class TaskListView extends StatelessWidget {
  final TaskViewModel model;

  const TaskListView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Задачи')),
      body: ValueListenableBuilder(
        valueListenable: model.tasks,
        builder: (_, tasks, __) {
          return ListView(
            children: tasks.map((task) {
              return ListTile(
                title: Text(task.title),
                trailing: Checkbox(
                  value: task.isDone,
                  onChanged: (_) => model.toggleTask(task.id),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final controller = TextEditingController();
          await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Новая задача"),
              content: TextField(controller: controller),
              actions: [
                TextButton(
                  onPressed: () {
                    model.addTask(controller.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Добавить"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
