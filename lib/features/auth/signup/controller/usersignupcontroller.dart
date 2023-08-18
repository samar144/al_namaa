import 'dart:convert';
import 'package:alnamaa_charity/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../core/widget/loading_widget.dart';
import '../../../../routes.dart';
import '../../../../utils/custom_snackbar.dart';
import '../model/user_register_model.dart';

class UserSignUpController extends GetxController {
  final date = DateTime.now().obs;
  // bool isEmailConfirmed = false;

  final RxString selectedcountry = 'syria'.obs;

  late TextEditingController emailEditController,
      passwordEditController,
      cpasswordEditController,
      firstnameEditController,
      lastnameEditController,
      verifyEditController,
      fathernameEditController,
      mothernameEditController,
      phonenumberEditController,
      telephoneEditController,
      birthdayEditController,
      jobEditController,
      cityEditController,
      stateEditController,
      streetEditController,
      countryEditController,
      studyEditController;

  @override
  void onInit() {
    super.onInit();
    emailEditController = TextEditingController();
    cpasswordEditController = TextEditingController();
    stateEditController = TextEditingController();
    verifyEditController = TextEditingController();
    streetEditController = TextEditingController();
    countryEditController = TextEditingController();
    passwordEditController = TextEditingController();
    firstnameEditController = TextEditingController();
    lastnameEditController = TextEditingController();
    fathernameEditController = TextEditingController();
    mothernameEditController = TextEditingController();
    phonenumberEditController = TextEditingController();
    telephoneEditController = TextEditingController();
    birthdayEditController = TextEditingController();
    jobEditController = TextEditingController();
    cityEditController = TextEditingController();
    studyEditController = TextEditingController();
    getcountry();
  }

  @override
  void onClose() {
    super.onClose();
    // emailEditController.dispose();
    // cpasswordEditController.dispose();
    // passwordEditController.dispose();
    // firstnameEditController.dispose();
    // lastnameEditController.dispose();
    // // verifyEditController.dispose();
    // fathernameEditController.dispose();
    // mothernameEditController.dispose();
    // phonenumberEditController.dispose();
    // telephoneEditController.dispose();
    // birthdayEditController.dispose();
    // jobEditController.dispose();
    // cityEditController.dispose();
    // streetEditController.dispose();
    // stateEditController.dispose();
    // countryEditController.dispose();
    // studyEditController.dispose();
  }

  final _countreies = RxList<dynamic>([]);
  List get countreies => _countreies.toList();
  getcountry() async {
    var response = await http.get(
        Uri.parse('${AppConstants.BASE_URL}/api/address/country'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]) {
        data.add(item);
      }
      _countreies.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  final _statess = RxList<dynamic>([]);
  List get statess => _statess.toList();
  void getstate({var country}) async {
    var response = await http.get(
        Uri.parse(
            '${AppConstants.BASE_URL}/api/address/state?country=$country'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]) {
        data.add(item);
      }
      _statess.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  final _cities = RxList<dynamic>([]);
  List get cities => _cities.toList();
  getcity({var contry, var state}) async {
    var response = await http.get(
        Uri.parse(
            '${AppConstants.BASE_URL}/api/address/city?country=$contry&state=$state'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]) {
        data.add(item);
      }
      _cities.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  final _streets = RxList<dynamic>([]);
  List get streets => _streets.toList();
  getstreet({var contry, var state, var city}) async {
    var response = await http.get(
        Uri.parse(
            '${AppConstants.BASE_URL}/api/address/street?country=$contry&state=$state&city=$city'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]) {
        data.add(item);
      }
      _streets.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  checksignup() {
    Get.showOverlay(
        asyncFunction: () => signup(), loadingWidget: const LoadingWidget());
  }

  signup() async {
    UserModel user = UserModel(
        email: emailEditController.text,
        password: passwordEditController.text,
        cpassword: passwordEditController.text,
        birth: birthdayEditController.text,
        first_name: firstnameEditController.text,
        city: cityEditController.text,
        street: streetEditController.text,
        state: stateEditController.text,
        country: countryEditController.text,
        father_name: fathernameEditController.text,
        job: jobEditController.text,
        last_name: lastnameEditController.text,
        phone_number: phonenumberEditController.text,
        mother_name: mothernameEditController.text,
        study: studyEditController.text,
        tele_number: telephoneEditController.text,
        role: 6);
    http.Response response = await http.post(
        Uri.parse(AppConstants.BASE_URL + '/api/app/register'),
        body: userModelToJson(user),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });
    var res = await jsonDecode(response.body);
    if (res["success"] == true) {
      var token = res["data"]["token"];
      await customsnackbar("sucsses", res['message'], "sucess");
      Get.offNamed(GetRoutes.verify, arguments: token);
    } else {
      customsnackbar(" Error", res['message'], "error");
    }
  }

  verifyemail() async {
    var response = await http.get(
        Uri.parse(AppConstants.BASE_URL +
            '/api/account/verify/${verifyEditController.text}'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${Get.arguments}"
        });
    var res = await jsonDecode(response.body);
    if (res["success"] == true) {
      // isEmailConfirmed = true;

      customsnackbar("", res['message'], "sucess");
      Get.offAllNamed(GetRoutes.login);
    } else {
      customsnackbar(res['message'], res['data'], "error");
    }
  }
}
