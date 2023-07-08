import 'package:shared_preferences/shared_preferences.dart';

class ShredPref {
  static Future<void> storeuser(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", user);
  }

  // static Future<dynamic> geteuser() async {
  static geteuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user");
  }

  static removeuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }

  static Future<void> storetoken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  static Future<String?> gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}
