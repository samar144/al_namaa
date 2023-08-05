import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/comment_model.dart';

class CommentController extends GetxController {
  late TextEditingController contentController, authorController;
  var comments = <Commentmodel>[].obs;

  @override
  void onInit() {
    contentController = TextEditingController();
    authorController = TextEditingController();
    super.onInit();
  }

  void fetchComments(var advertisementId) {
    // Fetch comments for the given advertisementId from API or database
    // Add fetched comments to the list using comments.add()
  }
  void addComment(Commentmodel comment) {
    comments.add(comment);
  }

  void updateComment(int index, Commentmodel updatedComment) {
    comments[index] = updatedComment;
  }

  void deleteComment(int index) {
    comments.removeAt(index);
  }
}
