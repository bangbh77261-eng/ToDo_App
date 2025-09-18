class User {
  final String empId;
  final String userId;
  final String empName;
  final String userName;
  final String cardNo;
  final String factory;
  final String section;
  final String department;
  final String workshop;
  final String workline;
  final DateTime? resign;

  User({
    required this.empId,
    required this.userId,
    required this.empName,
    required this.userName,
    required this.cardNo,
    required this.factory,
    required this.section,
    required this.department,
    required this.workshop,
    required this.workline,
    this.resign,
  });

  /// Convert từ JSON → User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      empId: json['empId'] ?? '',
      userId: json['userId'] ?? '',
      empName: json['empName'] ?? '',
      userName: json['userName'] ?? '',
      cardNo: json['cardNo'] ?? '',
      factory: json['factory'] ?? '',
      section: json['section'] ?? '',
      department: json['department'] ?? '',
      workshop: json['workshop'] ?? '',
      workline: json['workline'] ?? '',
      resign: json['resign'] != null ? DateTime.tryParse(json['resign']) : null,
    );
  }

  /// Convert từ User → JSON
  Map<String, dynamic> toJson() {
    return {
      'empId': empId,
      'userId': userId,
      'empName': empName,
      'userName': userName,
      'cardNo': cardNo,
      'factory': factory,
      'section': section,
      'department': department,
      'workshop': workshop,
      'workline': workline,
      'resign': resign?.toIso8601String(),
    };
  }
}
