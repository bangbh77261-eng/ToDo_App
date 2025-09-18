class UserModel {
  final int id;
  final String? userName;
  final String? userPassword;
  final String? createdAt;
  final String? role;
  final String? fullName;
  UserModel({
    required this.id,
    this.userName,
    this.userPassword,
    this.createdAt,
    this.role,
    this.fullName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      userName: json['user_name'],
      userPassword: json['user_password'],
      createdAt: json['created_at'],
      role: json['role'],
      fullName: json['full_name'],
    );
  }
}
