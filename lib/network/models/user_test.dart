class UserTest {
  int? userId;
  String? username;
  String? email;
  String? passwordHash;
  String? fullName;
  String? role;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  UserTest(
      {this.userId,
      this.username,
      this.email,
      this.passwordHash,
      this.fullName,
      this.role,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      });

  UserTest.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    email = json['email'];
    passwordHash = json['passwordHash'];
    fullName = json['fullName'];
    role = json['role'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['email'] = email;
    data['passwordHash'] = passwordHash;
    data['fullName'] = fullName;
    data['role'] = role;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}