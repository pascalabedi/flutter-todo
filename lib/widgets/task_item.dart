import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {

  final String title;
  final bool completed;
  final VoidCallback onChanged;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.title,
    required this.completed,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: Checkbox(
        value: completed,
        onChanged: (_) {
          onChanged();
        },
      ),

      title: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          decoration: completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),

      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: onDelete,
      ),
    );
  }
}