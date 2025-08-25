class AppUser {
  final String id;
  final String email;
  final String name;
  final List<dynamic> favorites;

  AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.favorites,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'name': name, 'favorites': favorites};
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      favorites: json['favorites'] ?? [],
    );
  }
}
