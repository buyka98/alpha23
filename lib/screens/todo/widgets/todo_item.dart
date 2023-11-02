import 'package:alpha23/models/todo_item_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatelessWidget {
  final TodoItemModel todo;

  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Icon(
            todo.isDone ? Icons.check_circle : Icons.circle_outlined,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(todo.detail ?? ""),
          ),
          Row(
            children: [
              Icon(Icons.calendar_month),
              Text(
                DateFormat.yMMMd().format(todo.deadline == null ? DateTime.now() : DateTime.parse(todo.deadline!)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
