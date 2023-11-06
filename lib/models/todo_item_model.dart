import 'package:json_annotation/json_annotation.dart';
part 'todo_item_model.g.dart';

@JsonSerializable()
class TodoItemModel {
  String? userId;
  String? todoId;
  String? detail;
  String? deadline;
  bool isDone;

  TodoItemModel({
    this.userId,
    this.todoId,
    this.detail,
    this.deadline,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() {
    return _$TodoItemModelToJson(this);
  }

  factory TodoItemModel.fromJson(Map<String, dynamic> json) {
    return _$TodoItemModelFromJson(json);
  }

  TodoItemModel copyWith({
    String? detail,
    String? deadline,
    bool? isDone,
  }) =>
      TodoItemModel(
        userId: userId,
        todoId: todoId,
        detail: detail ?? this.detail,
        deadline: deadline ?? this.deadline,
        isDone: isDone ?? this.isDone,
      );
  TodoItemModel changeIsDone() => copyWith(isDone: !isDone);
}
