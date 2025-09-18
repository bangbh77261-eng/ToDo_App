import 'dart:convert';
import 'package:http/http.dart' as http;

import 'API_Config.dart';



class RestApiService<T> {
  final String endpoint;
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  RestApiService({
    required this.endpoint,
    required this.fromJson,
    required this.toJson,
  });

  String get _urlUser => "${ApiConfig.userUrl}/$endpoint";
  
  /// 
  Future<List<T>> getAllData() async {
    final response = await http.get(Uri.parse(_urlUser));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => fromJson(e)).toList();
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  Future<T> getByName(String id) async {
    final response = await http.get(Uri.parse("$_urlUser/$id"));
    if (response.statusCode == 200) {
      return fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load item: ${response.statusCode}");
    }
  }

  Future<T> createNewData(T item) async {
    final response = await http.post(
      Uri.parse(_urlUser),
      headers: {"Content-Type": "application/json"},
      body: json.encode(toJson(item)),
    );
    if (response.statusCode == 201) {
      return fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create item: ${response.statusCode}");
    }
  }

  Future<void> updateData(int id, T item) async {
    final response = await http.put(
      Uri.parse("$_urlUser/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(toJson(item)),
    );
    if (response.statusCode != 204) {
      throw Exception("Failed to update item: ${response.statusCode}");
    }
  }

  Future<void> deleteData(int id) async {
    final response = await http.delete(Uri.parse("$_urlUser/$id"));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete item: ${response.statusCode}");
    }
  }
}
