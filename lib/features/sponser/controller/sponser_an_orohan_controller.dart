import 'dart:convert';
import 'package:alnamaa_charity/features/auth/signup/model/user_register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:alnamaa_charity/utils/app_constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes.dart';
import '../../../utils/baseurl.dart';
import '../../../utils/custom_snackbar.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../model/guarantees.dart';
import 'package:http/http.dart' as http;

class SponserAnOrphaneontroller extends GetxController {
  @override
  void onInit() {
    amountcontroller = TextEditingController();
    sponserIdcontroller = TextEditingController();
    orphanIdcontroller = TextEditingController();
    paymentWaycontroller = TextEditingController();
    startDatecontroller = TextEditingController();
    endDatecontroller = TextEditingController();
    notecontroller = TextEditingController();
    alternativeNamecontroller = TextEditingController();
    alternativePhonecontroller = TextEditingController();
    alternativeTelecontroller = TextEditingController();
    alternativeAddresscontroller = TextEditingController();
    orderStatuscontroller = TextEditingController();
    approverIdcontroller = TextEditingController();
    // getUser();
    super.onInit();
  }

  @override
  void onClose() {
    amountcontroller.dispose();
    // sponserIdcontroller.dispose();
    // orphanIdcontroller.dispose();
    // paymentWaycontroller.dispose();
    // startDatecontroller.dispose();
    // endDatecontroller.dispose();
    // alternativeNamecontroller.dispose();
    // alternativePhonecontroller.dispose();
    // alternativeTelecontroller.dispose();
    // alternativeAddresscontroller.dispose();
    // orderStatuscontroller.dispose();
    super.onClose();
  }

  final date = DateTime.now().obs;
  UserModel? user = GetStorageUtils().getUser();
  final RxString selectedItem = "سنوي".obs;
  final List<String> items = [
    "سنوي",
    "شهري",
    "ربع سنوي",
    "نصف سنوي",
  ];
  // UserModel user = getUser() as UserModel;

  // static Future<UserModel?> getUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userJson = prefs.getString('user');
  //   if (userJson != null) {
  //     Map<String, dynamic> userMap = jsonDecode(userJson);
  //     return UserModel.fromJson(userMap);
  //   }
  //   return null;
  // }

  late TextEditingController amountcontroller,
      sponserIdcontroller,
      orphanIdcontroller,
      paymentWaycontroller,
      startDatecontroller,
      endDatecontroller,
      alternativeNamecontroller,
      alternativePhonecontroller,
      alternativeTelecontroller,
      alternativeAddresscontroller,
      orderStatuscontroller,
      notecontroller,
      approverIdcontroller;

  createsponsorshiporder(var id, token) async {
    // Guarantees guarantees = Guarantees(
    //   sponsor_id: id,
    //   payment_way: "ربع سنوي",
    //   amount: 8000000,
    //   start_date: "2023-8-1",
    //   end_date: "2026-8-1",
    //   alternative_name: "alternativeNamecontro hgs",
    //   alternative_phone: "0009090999",
    //   alternative_tele: "3536647",
    //   note: "notecontroller.text",
    //   alternative_address: "damascus",
    // );
    http.Response response =
        await http.post(Uri.parse('$baseUrl/api/app/sponsorships'),
            // body: guaranteesToJson(guarantees),
            body: jsonEncode({
              "sponsor_id": id,
              "payment_way": paymentWaycontroller.text,
              "note": notecontroller.text,
              "amount": amountcontroller.text,
              "start_date": startDatecontroller.text,
              "end_date": endDatecontroller.text,
              "alternative_name": alternativeNamecontroller.text,
              "alternative_phone": alternativePhonecontroller.text,
              "alternative_tele": alternativeTelecontroller.text,
              "alternative_address": alternativeAddresscontroller.text
              // "order_status": 0,
              // "approver_id": 1
            }),
            headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      await customsnackbar("", res['message'], "sucess");
      alternativeAddresscontroller.clear();
      alternativeNamecontroller.clear();
      alternativePhonecontroller.clear();
      alternativeTelecontroller.clear();
      amountcontroller.clear();
      paymentWaycontroller.clear();
      startDatecontroller.clear();
      endDatecontroller.clear();
      notecontroller.clear();
    } else {
      res['errors'].forEach((field, error) {
        customsnackbar("", '$field: ${error[0]}', "error");
      });
    }
  }
}
