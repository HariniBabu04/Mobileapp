import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:8089/api"; // Localhost for Chrome web

  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    return jsonDecode(response.body);
  }

  static Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse("$baseUrl$endpoint"));
    return jsonDecode(response.body);
  }
}
