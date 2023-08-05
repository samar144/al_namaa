import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/signup/model/user_register_model.dart';

class ShredPref {
  static Future<void> saveUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user);
    // String userJson = jsonEncode(user.toJson());
    await prefs.setString('user', userJson);
  }

  static Future<UserModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromJson(userMap);
    }
    return null;
  }
  // static Future<void> storeuser(user) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("user", user);
  // }

  // // static Future<dynamic> geteuser() async {
  // static geteuser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("user");
  // }

  // static removeuser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.remove("user");
  // }

  static Future<void> storetoken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  static Future<String?> gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}
