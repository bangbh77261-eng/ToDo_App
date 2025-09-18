// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:todo_app_sister/network/models/user_model.dart';

// // Create
// final supabase = Supabase.instance.client;

// // Create
// Future<void> createTodo(Todo todo) async {
//   await supabase.from('todos').insert(todo.toJson());
// }

// // Read
// Future<List<Todo>> getTodos() async {
//   final response = await supabase.from('todos').select();
//   // Trả về List<Todo>
//   return (response as List<dynamic>)
//       .map((json) => Todo.fromJson(json))
//       .toList();
// }

// // Update
// Future<void> updateTodo(Todo todo) async {
//   await supabase.from('todos').update(todo.toJson()).eq('id', todo.id);
// }

// // Delete
// Future<void> deleteTodo(int id) async {
//   await supabase.from('todos').delete().eq('id', id);
// }
