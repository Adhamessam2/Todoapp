class UserModel {
  final String username, email, id;
  final int finshedTodos;
  List<dynamic> myTodosId = [];

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
    UserModel newUser = UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      myTodosId: json['myTodosId'] ?? [],
      finshedTodos: json['finshedTodos'] as int,
    );
    return newUser;
  }

  UserModel({
    required this.username,
    required this.email,
    required this.id,
    required this.finshedTodos,
    required this.myTodosId,
  });
}
