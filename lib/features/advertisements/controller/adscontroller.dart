import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../utils/baseurl.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../../auth/signup/model/user_register_model.dart';

class AdvertisementController extends GetxController {
  UserModel user = GetStorageUtils().getUser();

  checkadvertisementsWithCourse() {
    Get.showOverlay(
        asyncFunction: () => advertisementsWithCourse(),
        loadingWidget: const Center(
          child: CircularProgressIndicator(),
        ));
  }

  final _trainiingadvertisements = RxList<dynamic>([]);
  List get trainiingadvertisements => _trainiingadvertisements.toList();
  Future<void> trainiingAdvertisements() async {
    var response = await http
        .get(Uri.parse('$baseUrl/api/advertisements/category/3'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];

      for (var item in (res["data"])) {
        data.add(item);
      }
      _trainiingadvertisements.value = data;
      // if (response.statusCode == 200) {
      //   _advertisements = advertismentModelFromJson(res["data"]);
      // }}
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  final _entirtaimentadvertisements = RxList<dynamic>([]);
  List get entirtaimentadvertisements => _entirtaimentadvertisements.toList();
  Future<void> entirtaimentAdvertisements() async {
    var response = await http
        .get(Uri.parse('$baseUrl/api/advertisements/category/2'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];

      for (var item in (res["data"])) {
        data.add(item);
      }
      _entirtaimentadvertisements.value = data;
      // if (response.statusCode == 200) {
      //   _advertisements = advertismentModelFromJson(res["data"]);
      // }}
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  final _remmeberadvertisements = RxList<dynamic>([]);
  List get remmeberadvertisements => _remmeberadvertisements.toList();
  Future<void> remmeberAdvertisements() async {
    var response = await http
        .get(Uri.parse('$baseUrl/api/advertisements/category/4'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];

      for (var item in (res["data"])) {
        data.add(item);
      }
      _remmeberadvertisements.value = data;
      // if (response.statusCode == 200) {
      //   _advertisements = advertismentModelFromJson(res["data"]);
      // }}
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  final _advertisements1 = RxList<dynamic>([]);
  List get advertisementswithcorse => _advertisements1.toList();
  Future<void> advertisementsWithCourse() async {
    var response = await http
        .get(Uri.parse('$baseUrl/api/advertisementsWithCourse'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];

      for (var item in (res["data"])) {
        data.add(item);
      }
      _advertisements1.value = data;
      // if (response.statusCode == 200) {
      //   _advertisements = advertismentModelFromJson(res["data"]);
      // }}
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
