import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../core/widget/loading_widget.dart';
import '../../../../routes.dart';
import '../../../../utils/baseurl.dart';
import '../../../../utils/custom_snackbar.dart';
import '../model/user_register_model.dart';

class UserSignUpController extends GetxController {
  final date = DateTime.now().obs;
  final List<String> country = ['syria'];
  final List<String> city = [
    "mazah",
    "masaken barzeh",
    "almojtahed",
    "abaseen",
    "dwelaa",
    "atman",
    "mesyaf"
  ];
  final List<String> state = [
    "damascus",
    "damascus countryside",
    "daraa",
    "hamah",
    "tartous"
  ];
  final List<String> street = [
    "shekh",
    "banorama",
  ];
  // dynamic country;
  // final List<String> city = [];
  // final List<String> state = [];
  // final List<String> street = [];
  final RxString selectedcountry = 'syria'.obs;
  final RxString selectedstate = 'damascus'.obs;
  final RxString selectedcity = 'mazah'.obs;
  final RxString selectedstreet = 'shekh'.obs;
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
    getcountry();
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
  }

  @override
  void onClose() {
    super.onClose();
    emailEditController.dispose();
    cpasswordEditController.dispose();
    passwordEditController.dispose();
    firstnameEditController.dispose();
    lastnameEditController.dispose();
    // verifyEditController.dispose();
    fathernameEditController.dispose();
    mothernameEditController.dispose();
    phonenumberEditController.dispose();
    telephoneEditController.dispose();
    birthdayEditController.dispose();
    jobEditController.dispose();
    cityEditController.dispose();
    streetEditController.dispose();
    stateEditController.dispose();
    countryEditController.dispose();
    studyEditController.dispose();
  }

  getcountry() async {
    http.Response response = await http
        .get(Uri.parse('$baseUrl/api/address/country'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    });
    var res = await jsonDecode(response.body);

    return res["data"];
  }
  //  getstate(country) async {
  //   http.Response response = await http
  //       .get(Uri.parse('$baseUrl/api/address/city?country=$country'), headers: {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json"
  //   });
  //   var res = await jsonDecode(response.body);
  //   state.addAll(res["data"]);
  // }
  //  getcity(country,state) async {
  //   http.Response response = await http
  //       .get(Uri.parse('$baseUrl/api/address/city?country=$country&state=$state'), headers: {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json"
  //   });
  //   var res = await jsonDecode(response.body);
  //   city.addAll(res["data"]);
  // }
  //  getstreet() async {
  //   http.Response response = await http
  //       .get(Uri.parse('$baseUrl/api/address/street?country=syria&state=damascus&city=mazah&=shekh'), headers: {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json"
  //   });
  //   var res = await jsonDecode(response.body);
  //   street.addAll(res["data"]);
  // }

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
        Uri.parse('$baseUrl/api/app/register'),
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
        Uri.parse('$baseUrl/api/account/verify/${verifyEditController.text}'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${Get.arguments}"
        });
    var res = await jsonDecode(response.body);
    if (res["success"] == true) {
      customsnackbar("", res['message'], "sucess");
      Get.offAllNamed(GetRoutes.login);
    } else {
      customsnackbar(res['message'], res['data'], "error");
    }
  }
}
