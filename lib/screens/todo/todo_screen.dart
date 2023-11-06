import 'package:alpha23/models/todo_item_model.dart';
import 'package:alpha23/repositories/todo_repository.dart';
import 'package:alpha23/screens/todo/todo_add_screen.dart';
import 'package:alpha23/screens/todo/todo_edit_screen.dart';
import 'package:alpha23/screens/todo/widgets/todo_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoRepository todoRepository = TodoRepository();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<int> getCounter() {
    return _prefs.then((SharedPreferences prefs) {
      print("Init counter value: ${prefs.getInt('counter')}");
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do "),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          todoRepository.getTodo();
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoAddScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getCounter(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    color: Colors.amberAccent,
                    padding: EdgeInsets.all(20),
                    child: Text("Counter ${snapshot.data}"),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
              child: StreamBuilder<QuerySnapshot>(
                  stream: todoRepository.displayTodo(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, int i) {
                            dynamic doc = snapshot.data?.docs[i];
                            TodoItemModel todo = TodoItemModel.fromJson(
                              doc.data() as Map<String, dynamic>,
                            );
                            return TodoItem(
                              todo: todo,
                              handleEdit: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => TodoEditScreen(
                                            todo: todo,
                                            docId: doc.id,
                                          )),
                                );
                              },
                              handleCheck: () async {
                                todoRepository.checkTodo(docId: doc.id, isDone: todo.isDone);
                              },
                            );
                          });
                    } else {
                      return Text("No Data");
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
