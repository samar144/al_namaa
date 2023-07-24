// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widget/loading_widget.dart';
import '../../../../routes.dart';
import '../../../../utils/baseurl.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../signup/model/user_register_model.dart';
import '../model/user_login_model.dart';

class LoginController extends GetxController {
  late TextEditingController emailEditController,
      passwordEditController,
      cpasswordEditController,
      verifyEditController,
      tokenEditController;
  @override
  void onInit() {
    emailEditController = TextEditingController();
    tokenEditController = TextEditingController();
    verifyEditController = TextEditingController();
    passwordEditController = TextEditingController();
    cpasswordEditController = TextEditingController();
    // checkuser();
    super.onInit();
  }

  checkuser() async {
    var token = ShredPref.gettoken();
    if (token != null) {
      Get.offAllNamed(
        GetRoutes.sponserhomepage,
        predicate: (route) => true,
      );
    }
  }

  checklogin() {
    Get.showOverlay(
        asyncFunction: () => login(), loadingWidget: const LoadingWidget());
  }

  @override
  void onClose() {
    super.onClose();
    emailEditController.dispose();
    passwordEditController.dispose();
    cpasswordEditController.dispose();
    tokenEditController.dispose();
  }

  login() async {
    // UserLoginModel loginModel = UserLoginModel(
    //     email: emailEditController.text, password: passwordEditController.text);
    UserModel loginModel = UserModel(
        email: emailEditController.text, password: passwordEditController.text);
    var response = await http.post(Uri.parse('$baseUrl/api/login'),
        body: jsonEncode(loginModel),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });
    var res = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      //اسم اليوزر بالجيسون يلي بين قوسين القصد
      // UserLoginModel user = UserLoginModel(
      //     name: res['data']['name'], token: res['data']['token']);
      UserModel user =
          UserModel(name: res['data']['name'], token: res['data']['token']);
      await ShredPref.storeuser(jsonEncode(user));
      customsnackbar("signup sucsses", res['message'], "sucess");
      Get.offAllNamed(GetRoutes.verify);
    } else {
      customsnackbar("signup Error", res['message'], "error");
    }
  }

  forgetpassword() async {
    UserModel loginModel = UserModel(email: emailEditController.text);
    var response = await http.post(Uri.parse('$baseUrl/api/forget/password'),
        body: jsonEncode(loginModel),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });
    var res = await jsonDecode(response.body);
    if (res["success"] == false) {
      Get.offNamed(GetRoutes.resetpassword);
    } else {
      customsnackbar("signup Error", res['message'], "error");
    }
  }

  resetpassword() async {
    var response = await http.post(Uri.parse('$baseUrl/api/reset/password'),
        body: jsonEncode({
          "email": emailEditController.text,
          "password": passwordEditController.text,
          "password_confirmation": cpasswordEditController.text,
          "token": tokenEditController.text,
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });
    var res = await jsonDecode(response.body);
    if (res["success"] == true) {
      customsnackbar("", res['message'], "sucess");
      Get.offNamed(GetRoutes.login);
    } else {
      customsnackbar(res['message'], res['data']['error'], "error");
    }
  }

  var token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZmM3NDgxYzUzNzkzMGY0MDFhOGVkNzM2OGY1NDk3YzJmYWM5Mzg0MDRiMjM4NjMxMDQ1NzE0MTUyZGMwMWJhOGQ2NzAxYTA1YTRmZGExM2EiLCJpYXQiOjE2OTAxODMwMDMuODM3Mjc4LCJuYmYiOjE2OTAxODMwMDMuODM3MjgxLCJleHAiOjE3MjE4MDU0MDIuOTM3NDQ3LCJzdWIiOiIxNyIsInNjb3BlcyI6W119.dhjUhsB5W_AvM13_UNW7T1ua1ORrR0jf8Xbiv9u6_OmedvEcfqo0ZEKIe7p4T_ihd4GIQ3qZ451NB30qKJXm1fsWhfo5RBcKbEupINkfqdOR6U9ZQXTeCwh4LopUxhxUAsNjft3tEfTTXjFn3UT6QYOu5Zmx4Mm90Fx6SW1xXpueCVdhvekuHLLITZYAvMHd-rL0hT4NfRaycxnh7mKmEOrtaDZiOiG-fMbTRY7DHxFuYR9OryLF-6fbeVcSe5Iwf9MIGTNDUDDwxmq4bJnAUZPKfvZd-DaVCy1x25hZi5PC9pMh30OHZizBTAlg51HdZ2-mJMwMnK518nbkRZB2617IAIqpBL27EX44iIN2MDGg_ylPklk9-PifK7sHe9eFC8Zs_KSMv0BxCVuqPsgEDczrINJeGTx3FAYnT1ALuP3vlvd1kMt64UvllPVaedbtCDsZNmRrPBE1IXmd_FZ6vZlkTEDHiIMsvu_8Gv0bYGUh2QBuDh0IXayXkHupxLxnUTxSEFjG9liIeatoabGigGjxaZCYQq6l-YKDbFBKSl9zM2QO5-kPZZCceALZGaDiy_ZAFAZsPJScKBRsfb1TKl07CPo7u2GgKxPuX-ivY-DbToAvCQK5cwt_dCwx2jYMPLpvLT6EaxtQ4sPCSbUhD5aK6vjcHoE_jmkyciabvZ0";
  verifyemail() async {
    var response = await http.get(
        Uri.parse('$baseUrl/api/account/verify/${verifyEditController.text}'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);
    if (res["success"] == true) {
      customsnackbar("", res['message'], "sucess");
      Get.offAllNamed(GetRoutes.sponserhomepage);
    } else {
      customsnackbar(res['message'], res['data'], "error");
    }
  }
}
