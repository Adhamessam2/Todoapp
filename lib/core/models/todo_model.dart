import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/core/models/todo_item_model.dart';

class TodoModel {
  final String id, title, description;
  final DateTime deadline;
  final bool isCompleted;
  final List<TodoItem> todos;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'title': title,
      "deadline": deadline.toIso8601String(),
      "isCompleted": isCompleted,
      "todos": todos.map((todo) => todo.toJson()).toList(),
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      deadline: json['deadline'] is String
          ? DateTime.parse(json['deadline'])
          : (json['deadline'] as Timestamp).toDate(),
      isCompleted: json['isCompleted'] ?? false,
      todos: (json['todos'] as List<dynamic>?)
              ?.map((todoJson) => TodoItem.fromJson(todoJson))
              .toList() ??
          [],
    );
  }

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    this.isCompleted = false,
    this.todos = const [],
  });

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? deadline,
    bool? isCompleted,
    List<TodoItem>? todos,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      isCompleted: isCompleted ?? this.isCompleted,
      todos: todos ?? this.todos,
    );
  }

  bool get allTodosCompleted {
    return todos.isNotEmpty && todos.every((todo) => todo.isCompleted);
  }
}