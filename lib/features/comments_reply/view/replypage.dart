import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/CommentController.dart';
import '../controller/replycontroller.dart';
import '../model/comment_model.dart';
import '../model/reply_model.dart';

class ReplyPage extends StatelessWidget {
  ReplyPage({super.key, required this.comment});

  final Comment comment;
  final ReplyController replyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            elevation: 2,
            title: Text(
              "الردود",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.cyan[600]),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.cyan[600],
                ))),
        body: FutureBuilder<void>(
            future: replyController.fetchReply(comment.id),
            builder: (context, s) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  return Column(
                    children: [
                      // Display comment content and author
                      ListTile(
                        title: Text(comment.body!),
                      ),
                      // Display replies
                      Expanded(
                        child: ListView.builder(
                          // itemCount: replyController.replies.length,
                          itemCount: replyController.replies.length,
                          itemBuilder: (context, index) {
                            Reply reply = replyController.replies[index];
                            return ListTile(
                              // title: Text(comment.user!.firstName!),
                              subtitle: Text(reply.body!),
                            );
                          },
                        ),
                      )
                      // ),
                      ,
                      // Add reply
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  controller:
                                      replyController.replyeditcontroller,
                                  keyboardType: TextInputType.text,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                  ),
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1ea1a7),
                                            width: 1)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1ea1a7))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1ea1a7),
                                            width: 2)),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2),
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                    hintText: "اكتب تعليقك هنا",
                                    hintTextDirection: TextDirection.rtl,
                                    hintStyle: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () async {
                                      Reply newreply = Reply(
                                        body: replyController
                                            .replyeditcontroller.text,
                                        commentId: comment.id,
                                        userId: replyController.user.user_id,
                                      );

                                      await replyController.addReply(
                                          newreply, comment.id);
                                      replyController.fetchReply(comment.id);
                                    },
                                    icon: const Icon(Icons.send)))
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              );
            }),
      ),
    );
  }
}
