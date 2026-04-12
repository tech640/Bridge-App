import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000"; // emulator

  // ================= BACKEND =================
  static Future<Map<String, dynamic>?> login(
      String email, String password) async {

    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.body);
      return null;
    }
  }
// ================= BACKEND =================
  // ================= BACKEND SignUp =================
  static Future<Map<String, dynamic>?> register({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String dateOfBirth,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "gender_preference": gender,
        "date_of_birth": dateOfBirth,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.body);
      return null;
    }
  }
// ================= BACKEND =================
// ================= BACKEND =================
static Future<bool> checkUser(String email) async {
  final response = await http.post(
    Uri.parse("$baseUrl/auth/check-user"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": email,
    }),
  );

  final data = jsonDecode(response.body);
  return data["exists"];
}
// ================= BACKEND =================
}
