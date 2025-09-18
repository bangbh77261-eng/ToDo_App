import 'package:postgrest/postgrest.dart';
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  
  ApiException(this.message, {this.statusCode});
  
  @override
  String toString() => message;
}

// In your controller
Future<void> login() async {
  try {
    // ... existing login logic
  } on PostgrestException catch (e) {
    throw ApiException('Lỗi cơ sở dữ liệu: ${e.message}');
  } on Exception catch (e) {
    throw ApiException('Đã xảy ra lỗi không mong muốn');
  }
}