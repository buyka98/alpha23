// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItemModel _$TodoItemModelFromJson(Map<String, dynamic> json) =>
    TodoItemModel(
      userId: json['userId'] as String?,
      todoId: json['todoId'] as String?,
      detail: json['detail'] as String?,
      deadline: json['deadline'] as String?,
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$TodoItemModelToJson(TodoItemModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'todoId': instance.todoId,
      'detail': instance.detail,
      'deadline': instance.deadline,
      'isDone': instance.isDone,
    };
