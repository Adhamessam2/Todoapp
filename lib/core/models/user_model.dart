class UserModel {
  final String username, email, id;
  final int finshedTodos;
  List<String> myTodosId = [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'myTodosId': myTodosId,
      'finshedTodos': finshedTodos,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      finshedTodos: json['finshedTodos'],
      myTodosId: json['myTodosId'] ?? [],
    );
  }

  UserModel({
    required this.username,
    required this.email,
    required this.id,
    required this.finshedTodos,
    required this.myTodosId,
  });
}
