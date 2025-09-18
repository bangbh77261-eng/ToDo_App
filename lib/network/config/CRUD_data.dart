// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:todo_app_sister/network/models/user.dart';

// final supabase = Supabase.instance.client;

// class SupabaseUserService {
//   /// Lấy toàn bộ dữ liệu từ bảng user_detail
//   Future<List<UserModel>> getAllUsers() async {
//     final response = await supabase.from('user_detail').select().order('id');
//     print('📥 Supabase response: $response');

//     return (response as List)
//         .map((json) => UserModel.fromJson(json))
//         .toList();
//   }
// }
