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
import '../model/user_login_model.dart';

class LoginController extends GetxController {
  late TextEditingController emailEditController, passwordEditController;
  @override
  void onInit() {
    emailEditController = TextEditingController();
    passwordEditController = TextEditingController();
    checkuser();
    super.onInit();
  }

  checkuser() async {
    var user = ShredPref.geteuser();
    if (user != null) {
      Get.offAllNamed(GetRoutes.home);
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
  }

  // void login() async {
  //   UserLoginModel loginModel = UserLoginModel(
  //       email: emailEditController.text, password: passwordEditController.text);
  //   var response =
  //       await NetworkHandler.post(userLoginModelToJson(loginModel), "login");
  //   var res = jsonDecode(response);
  //   if (res['sucsses']) {
  //   customsnackbar("signup sucsses", res['message'], "sucess");
  //   //اسم اليوزر بالجيسون يلي بين قوسين القصد
  //   UserLoginModel user = userLoginModelFromJson(res['user']);
  //   await ShredPref.storeuser(jsonEncode(user));

  //   Get.offAllNamed(GetRoutes.home);
  // } else {
  //   customsnackbar("signup Error", res['message'], "error");
  // }
  // }

  login() async {
    var response = await http.post(Uri.parse(baseUrl + 'login'), body: {
      "email": emailEditController.text,
      "password": passwordEditController.text,
    });
    var res = await jsonDecode(response.body);
    if (res['sucsses']) {
      customsnackbar("signup sucsses", res['message'], "sucess");
      //اسم اليوزر بالجيسون يلي بين قوسين القصد
      UserLoginModel user = userLoginModelFromJson(res['user']);
      await ShredPref.storeuser(jsonEncode(user));

      Get.offAllNamed(GetRoutes.home);
    } else {
      customsnackbar("signup Error", res['message'], "error");
    }
  }
}
