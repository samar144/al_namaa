import 'package:alnamaa_charity/features/comments_reply/model/comment_model.dart';
import 'package:alnamaa_charity/features/comments_reply/view/replypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../advertisements/model/advertisement_model.dart';
import '../controller/CommentController.dart';
import '../controller/replycontroller.dart';

class CommentPage extends StatelessWidget {
  final AdvertismentModel advertisement;
  final CommentController commentController = Get.find();
  final ReplyController replyController = Get.find();

  CommentPage({required this.advertisement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comments')),
      body: Column(
        children: [
          // Display advertisement image and text
          Container(
            child: Text(advertisement.body),
          ),
          // Display comments
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: commentController.comments.length,
                itemBuilder: (context, index) {
                  Commentmodel comment = commentController.comments[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(comment.userId.toString()),
                        subtitle: Text(comment.body!),
                      ),
                      ElevatedButton(
                        child: Text('View Replies'),
                        onPressed: () {
                          // Fetch replies for the selected comment
                          replyController.fetchReplies(comment.id);

                          // Open the replies page
                          Get.to(ReplyPage(comment: comment));
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // Add comment
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Add Comment'),
              onPressed: () {
                // showDialog(
                //   // Add comment dialog
                //   // Collect comment content and author information
                //   // Call commentController.addComment() to add the new comment
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controller/CommentController.dart';
// import '../model/comment_model.dart';

// class CommentPage extends StatelessWidget {
//   final CommentController commentController = Get.put(CommentController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Comments')),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: commentController.comments.length,
//           itemBuilder: (context, index) {
//             Comment comment = commentController.comments[index];
//             return ListTile(
//               title: Text(comment.id.toString()),
//               subtitle: Text(comment.adveretismentId.toString()),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.edit),
//                     onPressed: () => _showEditDialog(context, index, comment),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () => commentController.deleteComment(index),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('Edit Comment'),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextField(controller: commentController.contentController),
//                     TextField(controller: commentController.authorController),
//                   ],
//                 ),
//                 actions: [
//                   TextButton(
//                     child: Text('Cancel'),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   TextButton(
//                     child: Text('Save'),
//                     onPressed: () {
//                       Comment newComment = Comment(
//                           body: commentController.contentController.text,
//                           adveretismentId:
//                               commentController.authorController.text);
//                       commentController.addComment(newComment);
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//           // Comment newComment =
//           //     Comment(body: 'New Comment', adveretismentId: 'John Doe');
//           // commentController.addComment(newComment);
//         },
//       ),
//     );
//   }

//   void _showEditDialog(BuildContext context, int index, Comment comment) {
//     TextEditingController contentController =
//         TextEditingController(text: comment.body);
//     TextEditingController authorController =
//         TextEditingController(text: comment.adveretismentId);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit Comment'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(controller: contentController),
//               TextField(controller: authorController),
//             ],
//           ),
//           actions: [
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () => Navigator.pop(context),
//             ),
//             TextButton(
//               child: Text('Save'),
//               onPressed: () {
//                 Comment updatedComment = Comment(
//                   body: contentController.text,
//                   adveretismentId: authorController.text,
//                 );
//                 commentController.updateComment(index, updatedComment);
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
