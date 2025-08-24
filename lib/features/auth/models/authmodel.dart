class AuthModel {
  final String email;
  final String name;
  final String id;

  AuthModel({required this.id, required this.email, required this.name});

  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name, 'id': id};
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(email: json['email'], name: json['name'], id: json['id']);
  }
}
