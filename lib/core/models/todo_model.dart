import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String id, title, description;
  final DateTime deadline;
  final List<String> depinedOnIt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'title': title,
      "deadline": deadline,
      "depinedOnIt": depinedOnIt,
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
      depinedOnIt: json['depinedOnIt'] ?? [],
    );
  }
  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.depinedOnIt,
  });
}
