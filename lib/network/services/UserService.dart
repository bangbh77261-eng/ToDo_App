// import 'package:todo_app_sister/network/config/CRUD_data.dart';
// import 'package:todo_app_sister/network/models/user_detail.dart';

// final userService = SupabaseCrudService<UserDetail>(
//   tableName: 'user_detail',
//   fromJson: (json) => UserDetail.fromJson(json),
// );

// // Gọi hàm
// Future<void> exampleUser() async {
//   final users = await userService.getAll();
//   print('Users: $users');

//   final user = await userService.getSingle('id', 1);
//   print('User ID=1: $user');

//   final newUser = await userService.create({
//     'user_name': 'Bang',
//     'user_password': '123456',
//   });
//   print('New user: $newUser');
// }
