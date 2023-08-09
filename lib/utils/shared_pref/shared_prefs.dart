import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/signup/model/user_register_model.dart';

class ShredPref {
  static Future<void> saveUserModel(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userModelJson = userModelToJson(userModel);
    await prefs.setString('userModel', userModelJson);
  }

  static Future<UserModel?> getUserModelFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userModelJson = prefs.getString('userModel');
    if (userModelJson != null) {
      return userModelFromJson(userModelJson);
    }
    return null;
  }

  static Future<void> removeUserModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userModel');
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
