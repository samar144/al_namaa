import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../utils/baseurl.dart';
import '../../auth/signup/model/user_register_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getsponsororders();
    user;
    getorphansponsor();
  }

  List acceptancesponserorders = [];
  List waitingsponserorders = [];
  List orphanforsponser = [];
  late UserModel user = Get.arguments;

  // عرض طلبات الكفالة
  Future getsponsororders() async {
    String token = user.token!;
    var response = await http.get(
        Uri.parse('$baseUrl/api/app/sponsorships/sponsor/order'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      acceptancesponserorders.addAll((res["data"]["acceptance"]));
      waitingsponserorders.addAll((res["data"]["waiting"]));
      update();
    } else {}
  }

//عرض ايتامي
  Future getorphansponsor() async {
    String token = user.token!;

    var response = await http
        .get(Uri.parse('$baseUrl/api/app/sponsorships/orphan'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    var res = await jsonDecode(response.body);
    // print(res["data"][0]["photo"]);
    if (response.statusCode == 200) {
      orphanforsponser.addAll((res["data"]));
      // print(orphanforsponser);
      update();
    } else {}
  }
}
