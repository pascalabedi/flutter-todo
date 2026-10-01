import 'package:flutter/material.dart';
import '../widgets/task_item.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  List<String> tasks = [
    'Apprendre Flutter',
    'Apprendre Dart',
    'Créer mon application',
  ];

  List<bool> completed = [
    false,
    false,
    false,
  ];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
      completed.add(false);
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      completed.removeAt(index);
    });
  }

  void toggleTask(int index) {
    setState(() {
      completed[index] = !completed[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes tâches'),
      ),

      body: ListView.builder(
        itemCount: tasks.length,

        itemBuilder: (context, index) {

          return TaskItem(
            title: tasks[index],
            completed: completed[index],

            onChanged: () {
              toggleTask(index);
            },

            onDelete: () {
              deleteTask(index);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddTaskDialog() {

    final controller = TextEditingController();

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text('Nouvelle tâche'),

          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Nom de la tâche',
            ),
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Annuler'),
            ),

            ElevatedButton(
              onPressed: () {

                if (controller.text.trim().isNotEmpty) {
                  addTask(controller.text.trim());
                  Navigator.pop(context);
                }

              },
              child: const Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }
}