import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../core/widget/loading_widget.dart';
import '../../../../routes.dart';
import '../../../../utils/baseurl.dart';
import '../../../../utils/custom_snackbar.dart';

class UserRegisterController extends GetxController {
  late TextEditingController emailEditController,
      passwordEditController,
      firstnameEditController,
      lastnameEditController,
      fathernameEditController,
      mothernameEditController,
      mobilephoneEditController,
      telephoneEditController,
      birthdayEditController,
      jobEditController,
      cityEditController,
      studyEditController;

  @override
  void onInit() {
    super.onInit();
    emailEditController = TextEditingController();
    passwordEditController = TextEditingController();
    firstnameEditController = TextEditingController();
    lastnameEditController = TextEditingController();
    fathernameEditController = TextEditingController();
    mothernameEditController = TextEditingController();
    mobilephoneEditController = TextEditingController();
    telephoneEditController = TextEditingController();
    birthdayEditController = TextEditingController();
    jobEditController = TextEditingController();
    cityEditController = TextEditingController();
    studyEditController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailEditController.dispose();
    passwordEditController.dispose();
    firstnameEditController.dispose();
    lastnameEditController.dispose();
    fathernameEditController.dispose();
    mothernameEditController.dispose();
    mobilephoneEditController.dispose();
    telephoneEditController.dispose();
    birthdayEditController.dispose();
    jobEditController.dispose();
    cityEditController.dispose();
    studyEditController.dispose();
  }

  checksignup() {
    Get.showOverlay(
        asyncFunction: () => signup(), loadingWidget: const LoadingWidget());
  }

  // void register() async {
  //   UserRegisterModel registerModel = UserRegisterModel(
  //     email: emailEditController.text,
  //     password: passwordEditController.text,
  //     birthday: birthdayEditController.text,
  //     firstname: firstnameEditController.text,
  //     city: cityEditController.text,
  //     fathername: fathernameEditController.text,
  //     job: jobEditController.text,
  //     lastname: lastnameEditController.text,
  //     mobilenumber: mobilephoneEditController.text,
  //     mothername: mothernameEditController.text,
  //     study: studyEditController.text,
  //     telenumber: telephoneEditController.text,
  //   );
  //   var response = await NetworkHandler.post(
  //       userRegisterModelToJson(registerModel), "login/signup");
  //   var res = jsonDecode(response);
  //   if (res['sucsses']) {
  //   customsnackbar("signup sucsses", res['message'], "sucess");
  //   Get.offAllNamed(GetRoutes.login);
  // } else {
  //   customsnackbar("signup Error", res['message'], "error");
  // }
  // }

  //header not include
  signup() async {
    var response = await http.post(Uri.parse(baseurl + 'signup'), body: {
      "email": emailEditController.text,
      "password": passwordEditController.text,
      "birthday": birthdayEditController.text,
      "firstname": firstnameEditController.text,
      "city": cityEditController.text,
      "fathername": fathernameEditController.text,
      "job": jobEditController.text,
      "lastname": lastnameEditController.text,
      "mobilenumber": mobilephoneEditController.text,
      "mothername": mothernameEditController.text,
      "study": studyEditController.text,
      "telenumber": telephoneEditController.text,
    });
    var res = await jsonDecode(response.body);
    if (res['sucsses']) {
      customsnackbar("signup sucsses", res['message'], "sucess");
      Get.offAllNamed(GetRoutes.login);
    } else {
      customsnackbar("signup Error", res['message'], "error");
    }
  }
}
