import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/replycontroller.dart';
import '../model/comment_model.dart';
import '../model/reply_model.dart';

class ReplyPage extends StatelessWidget {
  final Commentmodel comment;
  final ReplyController replyController = Get.find();

  ReplyPage({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Replies')),
      body: Column(
        children: [
          // Display comment content and author
          ListTile(
            title: Text(comment.adveretismentId.toString()),
            subtitle: Text(comment.body!),
          ),
          // Display replies
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: replyController.replies.length,
                itemBuilder: (context, index) {
                  Reply reply = replyController.replies[index];
                  return ListTile(
                    title: Text(reply.id.toString()),
                    subtitle: Text(reply.body.toString()),
                  );
                },
              ),
            ),
          ),
          // Add reply
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Add Reply'),
              onPressed: () {
                // showDialog(
                //   // Add reply dialog
                //   // Collect reply content and author information
                //   // Call replyController.addReply() to add the new reply
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
