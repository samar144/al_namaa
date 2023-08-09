import 'package:alnamaa_charity/features/comments_reply/model/comment_model.dart';
import 'package:alnamaa_charity/features/comments_reply/view/replypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/text_form_field.dart';
import '../../advertisements/model/advertisement_model.dart';
import '../controller/CommentController.dart';
import '../controller/replycontroller.dart';

class CommentPage extends StatelessWidget {
  CommentPage({required this.advertisement});

  final AdvertismentModel advertisement;
  final CommentController commentController = Get.find();
  final ReplyController replyController = Get.find();
  RxList<Commentmodel> objectList = [
    Commentmodel(
      id: "1",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    ),
    Commentmodel(
      id: "2",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    ),
    Commentmodel(
      id: "3",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    ),
    Commentmodel(
      id: "4",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    ),
    Commentmodel(
      id: "5",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    ),
    Commentmodel(
      id: "6",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    ),
    Commentmodel(
      id: "7",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    ),
    Commentmodel(
      id: "8",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    ),
  ].obs;

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
            child:
                // Obx(
                //   () =>
                ListView.builder(
              // itemCount: commentController.comments.length,
              itemCount: objectList.length,
              itemBuilder: (context, index) {
                Commentmodel comment = objectList[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(comment.id.toString()),
                      subtitle: Text(comment.body!),
                    ),
                    ElevatedButton(
                      child: Text('View Replies'),
                      onPressed: () {
                        // Fetch replies for the selected comment
                        // replyController.fetchReplies(comment.id);

                        // // Open the replies page
                        Get.to(ReplyPage(comment: comment));
                      },
                    ),
                  ],
                );
              },
            ),
            // ),
          ),
          // Add comment
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Add Comment'),
              onPressed: () {
                showDialog(
                    useSafeArea: true,
                    context: context,
                    builder: (context) => Dialog(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            height: MediaQuery.of(context).size.height / 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("اضافة تعليق"),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.warning_outlined),
                                      Text("الرجاء ذكر السبب "),
                                    ],
                                  ),
                                  TextFormFieldWidget(
                                    label: "",
                                    controller:
                                        commentController.contentController,
                                    maxlines: 5,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.cyan),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("رجوع")),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          objectList.add(Commentmodel(
                                              id: "9",
                                              body: commentController
                                                  .contentController.text));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: const Text("تأكيد"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
                // Add comment dialog
                // Collect comment content and author information
                // Call commentController.addComment() to add the new comment
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
