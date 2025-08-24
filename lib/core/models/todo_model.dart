class TodoModel {
  final String id, title, description;
  final DateTime deadline;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'title': title,
      "deadline": deadline,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      deadline: DateTime.parse(json['deadline']),
    );
  }
  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
  });
}
