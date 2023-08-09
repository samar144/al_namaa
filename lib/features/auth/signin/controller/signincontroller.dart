// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:alnamaa_charity/utils/app_constants.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/widget/loading_widget.dart';
import '../../../../routes.dart';

import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/shared_pref/getstorage.dart';
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
    // emailEditController.dispose();
    // passwordEditController.dispose();
    // cpasswordEditController.dispose();
    // tokenEditController.dispose();
  }

  login() async {
    // UserLoginModel loginModel = UserLoginModel(
    //     email: emailEditController.text, password: passwordEditController.text);
    UserModel loginModel = UserModel(
        email: emailEditController.text, password: passwordEditController.text);
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + '/api/login'),
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

      UserModel user = UserModel(
          name: res['data']['name'],
          token: res['data']['token'],
          user_id: res["data"]["user_id"],
          email: emailEditController.text!);
      GetStorageUtils().saveUser(user);
      customsnackbar("sucsses", res['message'], "sucess");
      if (res["data"]["role"][0] == "Sponsor") {
        Get.offAllNamed(
          GetRoutes.sponserhomepage,
        );
      } else if (res["data"]["role"][0] == "NormalUser") {
        // Get.offAllNamed(GetRoutes.sponserhomepage);
      } else {}
    } else {
      customsnackbar("signup Error", res['message'], "error");
    }
  }

  forgetpassword() async {
    UserModel loginModel = UserModel(email: emailEditController.text);
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + '/api/forget/password'),
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
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + '/api/reset/password'),
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
}
