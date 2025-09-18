// class Todo {
//   final int id;
//   final String title;
//   final bool isComplete;

//   Todo({required this.id, required this.title, required this.isComplete});

//   // Từ JSON (lấy từ Supabase)
//   factory Todo.fromJson(Map<String, dynamic> json) {
//     return Todo(
//       id: json['id'],
//       title: json['title'],
//       isComplete: json['is_complete'],
//     );
//   }

//   // Chuyển sang JSON (gửi lên Supabase)
//   Map<String, dynamic> toJson() {
//     return {'id': id, 'title': title, 'is_complete': isComplete};
//   }
// }
