import 'dart:convert';

import 'package:alnamaa_charity/features/Profile/profile_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    getProfileList();
    super.onInit();
  }

  var _prof = ProfileModel();

  // final _proaddress = RxList<dynamic>([]);
  ProfileModel get prof => _prof;
  var token = AppConstants.TOKEN;
  Future<void> getProfileList() async {
    http.Response response = await http.get(
        Uri.parse('${AppConstants.BASE_URL}/api/app/orphans/profile/2'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);
    // print(res);

    if (response.statusCode == 200) {
      _prof = ProfileModel.fromJson(res["data"]);
    } else {}
    update();
  }
}


//old
// import 'dart:convert';
// import 'package:alnamaa_charity/features/Profile/profile_model.dart';
// import 'package:flutter/material.dart';
// import 'package:alnamaa_charity/utils/app_constants.dart';
// import 'package:get/get.dart';
// import 'package:alnamaa_charity/features/Profile/profile_repo.dart';

// import 'package:http/http.dart' as http;

// class ProfileController extends GetxController {
//   @override
//   void onInit() {
//     getProfileList();
//     super.onInit();
//   }

//   final ProfileRepo profileRepo;
//   ProfileController({required this.profileRepo});
//   List<ProfileModel> _profileList = [];
//   List<ProfileModel> get profileList => _profileList;

//   bool _isLoaded = false;
//   bool get isLoaded => _isLoaded;

//   Future<void> getProfileList() async {
//     http.Response response = await http.get(
//         Uri.parse(AppConstants.BASE_URL + AppConstants.DATA_PROFILE),
//         headers: {
//           "Content-Type": "application/json",
//           "Accept": "application/json",
//         });
//     var res = await jsonDecode(response.body);

//     //return res["data"];
//     // Response response = await profileRepo.getProfileList();

//     if (response.statusCode == 200) {
//       print('got profile');

//       _profileList = [];
//       Map<String, dynamic> json = jsonDecode(response.body);
//       _profileList.addAll(res);
//       print(_profileList);
//       _isLoaded = true;
//       update();
//     } else {
//       print('could not get profile');

//       // print(_profileList);
//     }
//   }
// }
