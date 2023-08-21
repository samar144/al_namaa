import 'dart:convert';
import 'package:alnamaa_charity/features/courses/course_model.dart';
import 'package:alnamaa_charity/features/sponser/model/sponserprofilemodel.dart';
import 'package:alnamaa_charity/utils/app_constants.dart';
import 'package:alnamaa_charity/utils/custom_snackbar.dart';
import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/baseurl.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../../auth/signup/model/user_register_model.dart';

class HomeController extends GetxController {
  UserModel user = GetStorageUtils().getUser();
  var token;
  late TextEditingController notecontroller;
  @override
  void onInit() {
    super.onInit();
    // waitingsponserorders();
    // acceptedsponserorders();
    // waitingsponserorders();
    // acceptedsponserorders();
    getsponserprofile();
    // getProfileList();
    // getmyorphanProfile();

    token = user.token;
    notecontroller = TextEditingController();
    getCourses();
    getorphansponsor();
  }

  // UserModel user = Get.arguments;

  // طلبات قيد المعالجة
  final _datawaiting = RxList<dynamic>([]);
  List get waitingorder => _datawaiting.toList();
  Future<void> waitingsponserorders() async {
    // UserModel? user = await getUser();

    // String token = user!.token!;
    var response = await http.get(
        Uri.parse(
            '${AppConstants.BASE_URL}/api/app/sponsorships/sponsor/order'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]["waiting"]) {
        data.add(item);
      }
      _datawaiting.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

//طلبات مقبولة
  final _dataaccepted = RxList<dynamic>([]);
  List get acceptedorder => _dataaccepted.toList();
  Future<void> acceptedsponserorders() async {
    // UserModel? user = await getUser();

    // String token = user.token!;
    // String token = user!.token!;

    var response = await http.get(
        Uri.parse(
            '${AppConstants.BASE_URL}/api/app/sponsorships/sponsor/order'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]["acceptance"]) {
        data.add(item);
      }
      _dataaccepted.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

//عرض ايتامي

  final _orphanforsponser = RxList<dynamic>([]);
  List get orphanforsponser => _orphanforsponser.toList();
  Future<void> getorphansponsor() async {
    // UserModel? user = await getUser();

    // String token = user.token!;
    // String token = user!.token!;

    var response = await http.get(
        Uri.parse('${AppConstants.BASE_URL}/api/app/sponsorships/orphan'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in res["data"]) {
        data.add(item);
        print("$baseUrl${item["orphan"]["photo"].toString()}");
        print(item["orphan"]["first_name"].toString());
      }
      _orphanforsponser.value = data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  /////////////courses

  var _cou = RxList<dynamic>([]);

  List get cou => _cou.toList();

  DateTime now = DateTime.now();
  List<Course> activeCourses = [];
  List<Course> finishedCourses = [];
  List<Course> waitingCourses = [];

  Future<void> getCourses() async {
    print("Got courses");
    try {
      var response = await http.get(
        Uri.parse('${AppConstants.BASE_URL}/api/app/students/course'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        final List<Course> courses = [];
        var courseRes = jsonDecode(response.body);

        for (var item in courseRes["data"]) {
          courses.add(Course.fromJson(item));
        }

        activeCourses.clear();
        finishedCourses.clear();
        waitingCourses.clear();

        for (Course course in courses) {
          if (course.startDate.isAfter(now)) {
            waitingCourses.add(course);
          } else if (course.endDate.isBefore(now)) {
            finishedCourses.add(course);
          } else {
            activeCourses.add(course);
          }
        }

        print('Active Courses:');
        for (Course course in activeCourses) {
          print('Course ID: ${course.id}');
          print('Course Name: ${course.name}');
        }

        print('Finished Courses:');
        for (Course course in finishedCourses) {
          print('Course ID: ${course.id}');
          print('Course Name: ${course.name}');
        }

        print('Waiting Courses:');
        for (Course course in waitingCourses) {
          print('Course ID: ${course.id}');
          print('Course Name: ${course.name}');
        }

        print("Got courses");
      } else {
        throw Exception("Failed to fetch courses data");
      }
      update();
    } catch (e) {
      print("Error fetching courses: $e");
    }
    print("Got courses");
  }

  //تقديم طلب ايقاف كفالة
  stopsponsorshiporder(var spnsershipid) async {
    // String token = user.token!;

    var response = await http.post(
        Uri.parse(
            '${AppConstants.BASE_URL}/api/app/sponsorships/stop/$spnsershipid'),
        body: jsonEncode({"note": notecontroller.text}),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      customsnackbar("تم", res["message"], "success");
      notecontroller.clear();
    } else {
      customsnackbar("خطأ", res["message"], "error");
    }
  }

// بروفايل الكفيل
  var _prof = SonsorProfileModel();

  SonsorProfileModel get sponsorprof => _prof;
  Future<void> getsponserprofile() async {
    http.Response response = await http.get(
        Uri.parse('${AppConstants.BASE_URL}/api/sponsors/${user.user_id}'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      _prof = SonsorProfileModel.fromJson(res["data"]);
    } else {}
    update();
  }
}
