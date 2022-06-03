class DatabaseUserModel {
  final String id;
  final String fullName;
  final String email;
  bool isAuthenticated;

  DatabaseUserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.isAuthenticated = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'isAuthenticated': isAuthenticated ? 1 : 0,
    };
  }
}
