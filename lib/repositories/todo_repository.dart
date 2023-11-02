import 'package:alpha23/models/todo_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TodoRepository {
  // final firestore = ;
  final collection = FirebaseFirestore.instance.collection("todo");
  final auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> displayTodo() {
    return collection.snapshots();
  }

  void getTodo() {
    collection.get().then((value) => print("value ${value.docs.first.data()}"));
  }

  void addTodo({String? detail, String? deadline}) {
    TodoItemModel todo = TodoItemModel(
      userId: auth.currentUser?.uid,
      todoId: collection.doc().id,
      deadline: deadline,
      detail: detail,
    );
    collection.add(todo.toJson());
  }

  void editTodo({required String? docId, String? detail, String? deadline}) {
    collection.doc(docId).update({
      "detail": detail,
      "deadline": deadline,
    });
  }

  void checkTodo({required String? docId, required bool isDone}) {
    collection.doc(docId).update({"is_done": !isDone});
  }

  void deleteTodo({required String? docId}) {
    collection.doc(docId).delete();
  }
}
