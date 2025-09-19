import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCrudService<T> {
  final SupabaseClient client;
  final String tableName;
  final T Function(Map<String, dynamic>) fromJson;

  SupabaseCrudService({
    required this.tableName,
    required this.fromJson,
    SupabaseClient? client,
  }) : client = client ?? Supabase.instance.client;

  /// Lấy tất cả dữ liệu (có hỗ trợ phân trang)
  Future<List<T>> getAll({int? limit, int? offset}) async {
    // KHÔNG ép kiểu về PostgrestFilterBuilder nữa
    PostgrestTransformBuilder<PostgrestList> query = client.from(tableName).select();

    if (limit != null) {
      final start = offset ?? 0;
      final end = start + limit - 1;
      query = query.range(start, end); // vẫn đúng vì query là PostgrestTransformBuilder
    }

    final data = await query; // trả về PostgrestList (List<Map<String,dynamic>>)
    return data.map<T>((row) => fromJson(Map<String, dynamic>.from(row))).toList();
  }

  /// Lấy 1 row theo điều kiện
  Future<T?> getSingle(String column, dynamic value) async {
    final data = await client.from(tableName).select().eq(column, value).maybeSingle();
    if (data == null) return null;
    return fromJson(Map<String, dynamic>.from(data));
  }

  /// Tạo record mới
  Future<T> create(Map<String, dynamic> body) async {
    final data = await client.from(tableName).insert(body).select().single();
    return fromJson(Map<String, dynamic>.from(data));
  }

  /// Cập nhật record
  Future<T> update(String column, dynamic value, Map<String, dynamic> changes) async {
    final data = await client.from(tableName).update(changes).eq(column, value).select().single();
    return fromJson(Map<String, dynamic>.from(data));
  }

  /// Xóa record
  Future<void> delete(String column, dynamic value) async {
    await client.from(tableName).delete().eq(column, value);
  }

  /// Stream realtime
  Stream<List<T>> streamAll({int? limit, List<String> primaryKey = const ['id']}) {
    final stream = client.from(tableName).stream(primaryKey: primaryKey);
    return stream.map((rows) {
      final list = rows.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
      if (limit != null && list.length > limit) return list.sublist(0, limit);
      return list;
    });
  }
}
