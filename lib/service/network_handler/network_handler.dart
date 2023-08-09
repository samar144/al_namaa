import 'package:alnamaa_charity/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetworkHandler extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  @override
  // ignore: overridden_fields
  // allowAutoSignedCert = true;
  NetworkHandler({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //////////////////////////
  static final client = http.Client();
  // static const storage = FlutterSecureStorage();

  static post1(var body, String endpoint) async {
    var response = await client.post(buildurl(endpoint),
        body: body, headers: {"Content_type": "application/json"});
    return response.body;
  }

  static Future<dynamic> get1(String endpoint, String? token) async {
    var response = await client.get(buildurl(endpoint), headers: {
      "Content_type": "application/json",
      "Authoraization": "Bearer $token"
    });
    return response.body;
  }

  static Uri buildurl(String endpoint) {
    String host = AppConstants.BASE_URL;
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
