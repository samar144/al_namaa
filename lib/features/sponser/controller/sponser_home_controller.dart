import 'dart:convert';
import 'package:alnamaa_charity/routes.dart';
import 'package:alnamaa_charity/utils/custom_snackbar.dart';
import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/baseurl.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../../Profile/profile_model.dart';
import '../../auth/signup/model/user_register_model.dart';
import '../model/sponserprofilemodel.dart';

class HomeController extends GetxController {
  UserModel user = GetStorageUtils().getUser();
  // String orphan_id = GetStorageUtils().getorphanid();

  var token;

  late TextEditingController notecontroller;
  @override
  void onInit() {
    super.onInit();
    // waitingsponserorders();
    // acceptedsponserorders();
    getsponserprofile();
    // getProfileList();
    // getmyorphanProfile();
    token = user.token;
    notecontroller = TextEditingController();
    getorphansponsor();
  }

  // UserModel user = Get.arguments;

  // طلبات قيد المعالجة
  final _datawaiting = RxList<dynamic>([]);
  List get waitingorder => _datawaiting.toList();
  Future<void> waitingsponserorders() async {
    // UserModel? user = await getUser();

    // String token = user!.token!;
    var response = await http.get(
        Uri.parse('$baseUrl/api/app/sponsorships/sponsor/order'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]["waiting"]) {
        data.add(item);
      }
      _datawaiting.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

//طلبات مقبولة
  final _dataaccepted = RxList<dynamic>([]);
  List get acceptedorder => _dataaccepted.toList();
  Future<void> acceptedsponserorders() async {
    // UserModel? user = await getUser();
    // String token = user.token!;
    // String token = user!.token!;

    var response = await http.get(
        Uri.parse('$baseUrl/api/app/sponsorships/sponsor/order'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]["acceptance"]) {
        data.add(item);
      }
      _dataaccepted.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

//عرض ايتامي

  final _orphanforsponser = RxList<dynamic>([]);
  List get orphanforsponser => _orphanforsponser.toList();
  Future<void> getorphansponsor() async {
    var response = await http
        .get(Uri.parse('$baseUrl/api/app/sponsorships/orphan'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]) {
        data.add(item);
      }
      _orphanforsponser.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  //تقديم طلب ايقاف كفالة
  stopsponsorshiporder(var id) async {
    var response = await http.post(
        Uri.parse('$baseUrl/api/app/sponsorships/stop/$id'),
        body: jsonEncode({"note": notecontroller.text}),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      customsnackbar("تم", res["message"], "success");
      notecontroller.clear();
    } else {
      customsnackbar("خطأ", res["message"], "error");
    }
  }

// بروفايل الكفيل
  var _prof = SonsorProfileModel();

  SonsorProfileModel get sponsorprof => _prof;
  Future<void> getsponserprofile() async {
    http.Response response = await http.get(
        Uri.parse('${AppConstants.BASE_URL}/api/sponsors/${user.user_id}'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      _prof = SonsorProfileModel.fromJson(res["data"]);
    } else {}
    update();
  }

// عرض بروفايل اليتيم
  // var _prof1 = ProfileModel();

  // ProfileModel get prof1 => _prof1;
  // Future<void> getmyorphanProfile() async {
  //   http.Response response = await http.get(
  //       Uri.parse(
  //           '${AppConstants.BASE_URL}/api/app/orphans/profile/$orphan_id'),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json",
  //         "Authorization": "Bearer ${user.token}"
  //       });
  //   var res = await jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     _prof1 = ProfileModel.fromJson(res["data"]);
  //   } else {}
  //   update();
  // }
}
