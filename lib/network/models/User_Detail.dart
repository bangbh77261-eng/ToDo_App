import 'package:todo_app_sister/utils/date_util.dart';

class CustomerDetail {
  final int id;
  final DateTime createdAt;
  final String customerName;
  final String? phoneNumber;
  final String? address;
  final String? personCardId;
  final int? yearOld;
  final DateTime? birthDay;
  final String? character;
  final String? noteDetail;
  final DateTime? joinDate;
  final DateTime? leaveDate;
  final int? customerID;

  CustomerDetail({
    required this.id,
    required this.createdAt,
    required this.customerName,
    this.phoneNumber,
    this.address,
    this.personCardId,
    this.yearOld,
    this.birthDay,
    this.character,
    this.noteDetail,
    this.joinDate,
    this.leaveDate,
    this.customerID,
  });

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    try {
      if (value.toString().contains('T')) {
        final dateOnly = value.toString().split('T')[0];
        final parts = dateOnly.split('-');
        return DateTime(
          int.parse(parts[0]),
          int.parse(parts[1]),
          int.parse(parts[2]),
        );
      } else {
        final parsed = DateTime.parse(value.toString());
        return DateTime(parsed.year, parsed.month, parsed.day);
      }
    } catch (_) {
      return null;
    }
  }

  factory CustomerDetail.fromJson(Map<String, dynamic> json) {
    return CustomerDetail(
      id: json['id'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      customerName: json['customer_name'] ?? '',
      phoneNumber: json['phone_number']?.toString(),
      address: json['address'],
      personCardId: json['person_card_id'],
      yearOld: json['year_old'],
      birthDay: _parseDate(json['birth_day']),
      character: json['character'],
      noteDetail: json['note_detail'],
      joinDate: _parseDate(json['join_date']),
      leaveDate: _parseDate(json['leave_date']),
      customerID: json['customer_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'customer_name': customerName,
      'phone_number': phoneNumber,
      'address': address,
      'person_card_id': personCardId,
      'year_old': yearOld,
      'birth_day': _formatDateForServer(birthDay),
      'character': character,
      'note_detail': noteDetail,
      'join_date': _formatDateForServer(joinDate),
      'leave_date': _formatDateForServer(leaveDate),
      'customer_id': customerID,
    };
  }

  static String? _formatDateForServer(DateTime? date) {
    if (date == null) return null;
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  /// Getter hiển thị ngày đẹp cho UI
  String get birthDayDisplay {
    if (birthDay == null) return "Chưa có ngày sinh";
    return "${birthDay!.day.toString().padLeft(2, '0')}/${birthDay!.month.toString().padLeft(2, '0')}/${birthDay!.year}";
  }

  String get joinDateDisplay {
    if (joinDate == null) return "Chưa có ngày vào";
    return "${joinDate!.day.toString().padLeft(2, '0')}/${joinDate!.month.toString().padLeft(2, '0')}/${joinDate!.year}";
  }

  String get leaveDateDisplay {
    if (leaveDate == null) return "Chưa có ngày nghỉ";
    return "${leaveDate!.day.toString().padLeft(2, '0')}/${leaveDate!.month.toString().padLeft(2, '0')}/${leaveDate!.year}";
  }

  /// Thêm phương thức copyWith để tạo bản sao có field thay đổi
  CustomerDetail copyWith({
    int? id,
    DateTime? createdAt,
    String? customerName,
    String? phoneNumber,
    String? address,
    String? personCardId,
    int? yearOld,
    DateTime? birthDay,
    String? character,
    String? noteDetail,
    DateTime? joinDate,
    DateTime? leaveDate,
    int? customerID,
  }) {
    return CustomerDetail(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      customerName: customerName ?? this.customerName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      personCardId: personCardId ?? this.personCardId,
      yearOld: yearOld ?? this.yearOld,
      birthDay: birthDay ?? this.birthDay,
      character: character ?? this.character,
      noteDetail: noteDetail ?? this.noteDetail,
      joinDate: joinDate ?? this.joinDate,
      leaveDate: leaveDate ?? this.leaveDate,
      customerID: customerID ?? this.customerID,
    );
  }
}
