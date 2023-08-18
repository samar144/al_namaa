import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/reply_model.dart';

class ReplyController extends GetxController {
  late TextEditingController contentController, authorController;
  var replies = <Reply>[].obs;

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

  void fetchReplies(var commentId) {
    // Fetch replies for the given commentId from API or database
    // Add fetched replies to the list using replies.add()
  }
  void addReply(Reply reply) {
    replies.add(reply);
  }

  void updateReply(int index, Reply updatedReply) {
    replies[index] = updatedReply;
  }

  void deleteReply(int index) {
    replies.removeAt(index);
  }
}
