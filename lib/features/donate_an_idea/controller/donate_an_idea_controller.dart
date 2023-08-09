import 'dart:convert';

import 'package:alnamaa_charity/utils/app_constants.dart';

import 'package:alnamaa_charity/features/donate_an_idea/model/idea_model.dart';
import 'package:alnamaa_charity/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../utils/baseurl.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../../../utils/shared_pref/shared_prefs.dart';
import '../../auth/signin/model/user_login_model.dart';
import '../../auth/signup/model/user_register_model.dart';

class DonateAnIdeaController extends GetxController {
  late TextEditingController ideatitleEditController,
      ideaEditController,
      costEditController,
      profitEditController;

  @override
  void onInit() {
    super.onInit();
    ideatitleEditController = TextEditingController();
    ideaEditController = TextEditingController();
    costEditController = TextEditingController();

    profitEditController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    ideatitleEditController.dispose();
    ideaEditController.dispose();
    costEditController.dispose();

    profitEditController.dispose();
  }

  donateanidea() async {
    UserModel? user = GetStorageUtils().getUser();

    // UserLoginModel user = UserLoginModel.fromJson((usr));

    IdeaModel idea = IdeaModel(
        userId: user!.user_id.toString(),
        idea: ideaEditController.text,
        cost: costEditController.text,
        ideatitle: ideatitleEditController.text,
        profit: profitEditController.text);
    http.Response response = await http.post(
        Uri.parse(AppConstants.BASE_URL + "/api/donateanidea"),
        body: jsonEncode(idea),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });
    // var res = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      customsnackbar("", "شكراً على الفكرة", "success");
    } else {
      customsnackbar("", "يرجى المحاولة لاحقاً", "error");
    }
  }
}
