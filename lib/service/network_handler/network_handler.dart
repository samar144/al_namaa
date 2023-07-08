import 'package:alnamaa_charity/utils/baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetworkHandler {
  static final client = http.Client();
  // static const storage = FlutterSecureStorage();

  static post(var body, String endpoint) async {
    var response = await client.post(buildurl(endpoint),
        body: body, headers: {"Content_type": "application/json"});
    return response.body;
  }

  static Future<dynamic> get(String endpoint, String? token) async {
    var response = await client.get(buildurl(endpoint), headers: {
      "Content_type": "application/json",
      "Authoraization": "Bearer $token"
    });
    return response.body;
  }

  static Uri buildurl(String endpoint) {
    String host = baseUrl;
    final apipath = host + endpoint;
    return Uri.parse(apipath);
  }

  static Future<void> storetoken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  static Future<String?> gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  // store token
  // static void storetoken(String token) async {
  //   await storage.write(key: "token", value: token);
  // }

  // static Future<String?> gettoken(String token) async {
  //   return await storage.read(key: "token");
  // }
}
