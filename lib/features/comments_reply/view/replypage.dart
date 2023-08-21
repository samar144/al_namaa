import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/CommentController.dart';
import '../controller/replycontroller.dart';
import '../model/comment_model.dart';
import '../model/reply_model.dart';

class ReplyPage extends StatelessWidget {
  ReplyPage({Key? key, required this.comment}) : super(key: key);

  final Commentmodel comment;
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
              return Obx(() => Column(
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
                            ReplyModel reply = replyController.replies[index];
                            return ListTile(
                              title: Text(reply.id.toString()),
                              subtitle: Text(reply.body.toString()),
                            );
                          },
                        ),
                      )
                      // ),
                      ,
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
                  ));
            }),
      ),
    );
  }
}
