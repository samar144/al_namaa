import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../utils/baseurl.dart';
import '../../../utils/custom_snackbar.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../../auth/signup/model/user_register_model.dart';
import '../model/reply_model.dart';

class ReplyController extends GetxController {
  late TextEditingController replyeditcontroller;
  // var repliess = <ReplyModel>[].obs;
  UserModel user = GetStorageUtils().getUser();

  @override
  void onInit() {
    replyeditcontroller = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  final RxList _replies = [].obs;
  // final _replies = <ReplyModel>[].obs;

  // List<Commentmodel> _comment = [].obs;

  List get replies => _replies;

  Future<void> fetchReply(var commentId) async {
    // Fetch replies for the given commentId from API or database
    // Add fetched replies to the list using replies.add()

    var response = await http
        .get(Uri.parse('$baseUrl/api/repliesOfComment/$commentId'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    });
    var res = await jsonDecode(response.body);
    var dataa = (res["data"]);

    if (response.statusCode == 200) {
      // var dataa = Commentmodel.fromJson(res["data"]);
      // final List data = [];
      _replies.clear();

      for (var item in res["data"]) {
        // final comment1 = Commentmodel.fromJson(item);
        var comment1 = Reply.fromJson(item);

        _replies.add(comment1);
      }
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  Future<void> addReply(Reply reply, var commentid) async {
    var response = await http.post(Uri.parse('$baseUrl/api/reply'),
        body: jsonEncode(reply),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${user.token}"
        });
    var res = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      _replies.add(reply);

      replyeditcontroller.clear();
      fetchReply(commentid);
      customsnackbar("", res["message"], "success");
    } else {
      customsnackbar("title", res["message"], "error");
    }

    void updateReply(int index, ReplyModel updatedReply) {
      replies[index] = updatedReply;
    }

    void deleteReply(int index) {
      replies.removeAt(index);
    }
  }
}
