import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../utils/baseurl.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../../auth/signup/model/user_register_model.dart';
import '../model/reply_model.dart';

class ReplyController extends GetxController {
  late TextEditingController contentController, authorController;
  // var repliess = <ReplyModel>[].obs;
  UserModel user = GetStorageUtils().getUser();

  @override
  void onInit() {
    contentController = TextEditingController();
    authorController = TextEditingController();
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
        .get(Uri.parse('$baseUrl/api/repliesOfComment/234'), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${user.token}"
    });
    var res = await jsonDecode(response.body);
    var dataa = (res["data"]);

    if (response.statusCode == 200) {
      _replies.clear();

      for (var item in dataa) {
        ReplyModel reply = ReplyModel.fromJson(item);
        //   final reply = ReplyModel.fromJson(item);
        _replies.add(reply);
      }
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  void addReply(ReplyModel reply) {
    replies.add(reply);
  }

  void updateReply(int index, ReplyModel updatedReply) {
    replies[index] = updatedReply;
  }

  void deleteReply(int index) {
    replies.removeAt(index);
  }
}
