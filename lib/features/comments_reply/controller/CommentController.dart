import 'package:alnamaa_charity/features/advertisements/model/advertisement_model.dart';
import 'package:alnamaa_charity/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../utils/app_constants.dart';
import '../../../utils/baseurl.dart';

import '../../../utils/shared_pref/getstorage.dart';
import '../../auth/signup/model/user_register_model.dart';
import '../model/comment_model.dart';

class CommentController extends GetxController {
  late TextEditingController commenteditcontroller;
  // var comments = <Commentmodel>[].obs;
  UserModel user = GetStorageUtils().getUser();

  @override
  void onInit() {
    commenteditcontroller = TextEditingController();
    // fetchComments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // List comments = [];

  // fetchcomments(var advertisementId) async {
  //   var response = await http
  //       .get(Uri.parse('$baseUrl/api/comments/$advertisementId'), headers: {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer ${user.token}"
  //   });
  //   var res = await jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     comments.clear();

  //     comments = Commentmodel.fromJson(res).comment!;
  //     print(comments.runtimeType);
  //     update();
  //   } else {
  //     customsnackbar("Error", "Faild to fetch todos", "error");
  //   }
  // }
// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final RxList _comment = [].obs;
  // List<Commentmodel> _comment = [].obs;

  List get comment => _comment.toList();
  Future<void> fetchcomments(var advertisementId) async {
    // Fetch comments for the given advertisementId from API or database
    // Add fetched comments to the list using comments.add()
    var response = await http
        .get(Uri.parse('$baseUrl/api/comments/$advertisementId'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      // var dataa = Commentmodel.fromJson(res["data"]);
      // final List data = [];
      _comment.clear();

      for (var item in res["data"]) {
        // final comment1 = Commentmodel.fromJson(item);
        var comment1 = Comment.fromJson(item);

        _comment.add(comment1);
      }

      // }
      // _comment.value = data;

      // var jsonResponse = jsonDecode(response.body);
      // List<Commentmodel> comments = List<Commentmodel>.from(
      //     jsonResponse["data"].map((x) => Commentmodel.fromJson(x)));

      // _comment.assignAll(comments);
    } else {
      throw Exception("Failed to fetch data");
    }
  }

// //   /////////////////////////////////////////////////////////////////////////////
  Future<void> addComment(Comment comm, var adsid) async {
    var response = await http.post(
        Uri.parse('${AppConstants.BASE_URL}/api/comments'),
        body: jsonEncode(comm),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}"
        });
    var res = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      _comment.add(comm);

      commenteditcontroller.clear();
      fetchcomments(adsid);
      customsnackbar("", res["message"], "success");
    } else {}
  }

//   edittodo(id, Commentmodel updatedcomment) async {
//     var response = await http.post(Uri.parse('$baseUrl/api/comments/edit/$id'),
//         body: jsonEncode(updatedcomment),
//         headers: {
//           "Content-Type": "application/json",
//           "Accept": "application/json",
//           "Authorization": "Bearer ${user.token}"
//         });
//     var res = await jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       comment[0]["id"] = updatedcomment;

//       customsnackbar("Sucsses", res['message'], "sucsses");
//       commenteditcontroller.text = "";
//       // fetchComments();
//     } else {
//       customsnackbar("Error", res['message'], "error");
//     }
//     update();
//   }

//   void updateComment(int index, Commentmodel updatedComment) {
//     // comments[index] = updatedComment;
//   }

//   void deleteComment(int index) {
//     // comments.removeAt(index);
//   }
}
