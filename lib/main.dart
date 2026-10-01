import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mes tâches',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  // Notre liste de tâches
  List<String> tasks = [
    'Apprendre Flutter',
    'Créer ma première application',
    'Apprendre Dart',
  ];

  // Ajouter une tâche
  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  // Supprimer une tâche
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
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
          return ListTile(
            leading: const Icon(Icons.check_circle_outline),

            title: Text(tasks[index]),

            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                deleteTask(index);
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Fenêtre pour ajouter une tâche
  void showAddTaskDialog(BuildContext context) {

    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
          title: const Text('Nouvelle tâche'),

          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Ex: Apprendre les widgets',
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
