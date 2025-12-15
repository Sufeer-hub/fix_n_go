import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/User.dart';
// import your User model

class UserService {
  static const String userKey = "user_data";

  /// Save User Data to SharedPreferences
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(userKey, userJson);
  }

  /// Get User Object from SharedPreferences
  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(userKey);

    if (jsonString == null) return null;
    return User.fromJson(jsonDecode(jsonString));
  }

  /// Check Login Status
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userKey) != null;
  }

  /// Get Access Token
  Future<String?> getToken() async {
    User? user = await getUser();
    return user?.access;
  }

  /// Logout / Clear User Data
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }
}
