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
    fetchComments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var _comment = RxList<dynamic>([]);
  List get comment => _comment;
  Future<void> fetchComments(
      // var advertisementId
      ) async {
    // Fetch comments for the given advertisementId from API or database
    // Add fetched comments to the list using comments.add()
    var response =
        await http.get(Uri.parse('$baseUrl/api/comments/24'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = [];
      for (var item in (res["data"])) {
        data.add(item);
      }
      _comment.value = data;
      // if (response.statusCode == 200) {
      //   _advertisements = advertismentModelFromJson(res["data"]);
      // }}
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  // void addComment(Commentmodel comment) {

  //   comments.add(comment);
  // }

  addComment(Commentmodel comment) async {
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + '/api/comments'),
        body: jsonEncode(comment.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}"
        });
    var res = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      _comment.add(comment);
      commenteditcontroller.clear();
      customsnackbar("title", res["message"], "success");
    } else {}
  }

  void updateComment(int index, Commentmodel updatedComment) {
    // comments[index] = updatedComment;
  }

  void deleteComment(int index) {
    // comments.removeAt(index);
  }
}
