import 'dart:convert';
import 'package:alnamaa_charity/utils/custom_snackbar.dart';
import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/baseurl.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../../auth/signup/model/user_register_model.dart';

class HomeController extends GetxController {
  UserModel user = GetStorageUtils().getUser();
  var token;
  late TextEditingController notecontroller;
  @override
  void onInit() {
    super.onInit();
    // waitingsponserorders();
    // acceptedsponserorders();
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
    // UserModel? user = await getUser();

    // String token = user.token!;
    // String token = user!.token!;

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
//عرض ايتامي
  // Future getorphansponsor() async {
  //   String token = user.token!;

  //   var response = await http
  //       .get(Uri.parse('$baseUrl/api/app/sponsorships/orphan'), headers: {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer $token"
  //   });
  //   var res = await jsonDecode(response.body);
  //   // print(res["data"][0]["photo"]);
  //   if (response.statusCode == 200) {
  //     orphanforsponser.addAll((res["data"]));
  //     // print(orphanforsponser);
  //     update();
  //   } else {}
  // }

  //تقديم طلب ايقاف كفالة
  stopsponsorshiporder(var id) async {
    // String token = user.token!;

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
}
