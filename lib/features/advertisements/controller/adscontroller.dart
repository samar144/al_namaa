import 'dart:convert';

import 'package:alnamaa_charity/features/advertisements/model/advertisement_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../utils/baseurl.dart';
import '../../../utils/custom_snackbar.dart';

class AdsController extends GetxController {
  List<AdvertismentModel> ads = [];

  fetchmytodos() async {
    var response = await http.get(
      Uri.parse("$baseUrl/home"),
    );
    var res = await jsonDecode(response.body);

    if (res['success']) {
      ads.addAll(res);
      update();
      return ads;
    } else {
      customsnackbar("Error", "Faild to fetch ads", "error");
    }
  }
}
