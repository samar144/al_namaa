import 'dart:convert';
import 'package:alnamaa_charity/utils/app_constants.dart';
import 'package:alnamaa_charity/features/advertisements/model/advertisement_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../utils/baseurl.dart';
import '../../../utils/custom_snackbar.dart';

class AdvertisementController extends GetxController {
  // List<AdvertismentModel> ads = [];

  // fetchmytodos() async {
  //   var response = await http.get(
  //     Uri.parse("$baseUrl/home"),
  //   );
  //   var res = await jsonDecode(response.body);

  //   if (res['success']) {
  //     ads.addAll(res);
  //     update();
  //     return ads;
  //   } else {
  //     customsnackbar("Error", "Faild to fetch ads", "error");
  //   }
  // }

  final _advertisements = RxList<dynamic>([
    {
      {
        "id": "id",
        "title": "title",
        "body": "body",
        "image": "image",
        "hint": "hint",
      },
      {
        "id": "id",
        "title": "title",
        "body": "body",
        "image": "image",
        "hint": "hint",
      }
    }
  ]);
  List get advertisements => _advertisements.toList();

  // final _advertisements = RxList<dynamic>([]);
  // List get advertisements => _advertisements.toList();
  // Future<void> fetchAdvertisements() async {
  //   // String token = user.token!;
  //   var response = await http
  //       .get(Uri.parse('$baseUrl/api/app/sponsorships/orphan'), headers: {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     // "Authorization": "Bearer $token"
  //   });
  //   var res = await jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     final List data = [];
  //     for (var item in res["data"]) {
  //       data.add(item);
  //     }
  //     _advertisements.value = data;
  //   } else {
  //     throw Exception("Failed to fetch data");
  //   }
  // }
}
