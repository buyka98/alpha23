import 'package:alpha23/models/todo_item_model.dart';
import 'package:alpha23/screens/todo/todo_add_screen.dart';
import 'package:alpha23/screens/todo/todo_edit_screen.dart';
import 'package:alpha23/screens/todo/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do "),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoAddScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 10; i++)
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TodoEditScreen(
                                todo: TodoItemModel(
                              detail: "jjjsj",
                              deadline: DateTime.now().toString(),
                            ))));
                  },
                  child: TodoItem(
                    todo: TodoItemModel(
                      detail: "jjjsj",
                      deadline: DateTime.now().toString(),
                    ),
                  ),
                ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
