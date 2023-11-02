class TodoItemModel {
  bool isDone;
  String? detail;
  String? deadline;
  String? todoId;
  String? userId;

  TodoItemModel({
    this.isDone = false,
    this.detail,
    this.deadline,
    this.todoId,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      "": userId,
    };
  }
}
