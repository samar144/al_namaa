import 'package:alnamaa_charity/features/comments_reply/model/comment_model.dart';
import 'package:alnamaa_charity/features/comments_reply/view/replypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../advertisements/model/advertisement_model.dart';
import '../controller/CommentController.dart';
import '../controller/replycontroller.dart';

class CommentPage extends StatelessWidget {
  CommentPage({Key? key, required this.advertisement}) : super(key: key);

  final AdvertismentModel advertisement;
  final CommentController commentController = Get.find();
  final ReplyController replyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            title: Text(
              "التعليقات",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.cyan[600]),
            ),
            elevation: 2,
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
            future: commentController.fetchComments(advertisement.id),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  return Column(
                    children: [
                      // Display advertisement image and text
                      Container(
                        child: Text(
                          advertisement.body!,
                          style: const TextStyle(letterSpacing: 0),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.cyan[600],
                        height: 12,
                      ),
                      // Display comments
                      Expanded(
                        child: ListView.builder(
                          itemCount: commentController.comment.length,
                          itemBuilder: (context, index) {
                            Commentmodel comment =
                                // Commentmodel.fromJson(
                                commentController.comment[index];
                            // )
                            // User u = User.fromJson(
                            //     commentController.comment[index].user);
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(comment.user!.firstName!),
                                  subtitle: Text(comment.body!),
                                ),
                                ElevatedButton(
                                  child: const Text('View Replies'),
                                  onPressed: () {
                                    replyController.fetchReply(comment.id);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ReplyPage(comment: comment),
                                    ));
                                  },
                                ),
                                Divider(),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Add comment
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
                                      commentController.commenteditcontroller,
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
                                      // Commentmodel newComment = Commentmodel(
                                      //     body: commentController
                                      //         .commenteditcontroller.text,
                                      //     userId:
                                      //         commentController.user.user_id,
                                      //     advertisementId: advertisement.id);

                                      // var newcommment1 = {
                                      //   "body": commentController
                                      //       .commenteditcontroller.text,
                                      //   "userId":
                                      //       commentController.user.user_id,
                                      //   "advertisementId": advertisement.id,
                                      //   "user": User(first_name: commentController.user.first_name!, lastName: lastName)
                                      // };
                                      // await commentController.addComment(
                                      //   advertisementId: advertisement.id,
                                      //   body: commentController
                                      //       .commenteditcontroller.text,
                                      //   userId: commentController.user.user_id,
                                      // );
                                      // await commentController
                                      //     .addComment(newComment);
                                      // commentController
                                      //     .fetchComments(advertisement.id);
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

// import 'package:alnamaa_charity/features/comments_reply/model/comment_model.dart';
// import 'package:alnamaa_charity/features/comments_reply/view/replypage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../advertisements/model/advertisement_model.dart';
// import '../controller/CommentController.dart';

// class CommentPage extends StatelessWidget {
//   CommentPage({super.key, required this.advertisement});

//   final AdvertismentModel advertisement;
//   final CommentController commentController = Get.find();
//   // final ReplyController replyController = Get.find();
//   // RxList<Commentmodel> objectList = [
//   //   Commentmodel(
//   //     id: "1",
//   //     body:
//   //         "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//   //   ),
//   //   Commentmodel(
//   //     id: "2",
//   //     body:
//   //         "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//   //   ),
//   //   Commentmodel(
//   //     id: "3",
//   //     body:
//   //         "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//   //   ),
//   //   Commentmodel(
//   //     id: "4",
//   //     body:
//   //         "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//   //   ),
//   //   Commentmodel(
//   //     id: "5",
//   //     body:
//   //         "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//   //   ),
//   //   Commentmodel(
//   //     id: "6",
//   //     body:
//   //         "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//   //   ),
//   //   Commentmodel(
//   //     id: "7",
//   //     body:
//   //         "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//   //   ),
//   //   Commentmodel(
//   //     id: "8",
//   //     body:
//   //         "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//   //   ),
//   // ].obs;

//   @override
//   Widget build(BuildContext context) {
//     // commentController.fetchComments();
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         key: key,
//         appBar: AppBar(
//             toolbarHeight: 80,
//             backgroundColor: Colors.white,
//             title: Text(
//               "التعليقات",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold, color: Colors.cyan[600]),
//             ),
//             elevation: 2,
//             centerTitle: true,
//             leading: IconButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: Icon(
//                   Icons.backspace_outlined,
//                   color: Colors.cyan[600],
//                 ))),
//         body: FutureBuilder<void>(
//             future: commentController.fetchComments(),
//             builder: (context, snapshot) {
//               return Obx(() {
//                 return Column(
//                   children: [
//                     // Display advertisement image and text
//                     Container(
//                       child: Text(
//                         advertisement.body!,
//                         style: const TextStyle(letterSpacing: 0),
//                       ),
//                     ),
//                     // Display comments
//                     Expanded(
//                       child:
//                           // Obx(
//                           //   () =>
//                           ListView.builder(
//                         // itemCount: commentController.comments.length,
//                         itemCount: commentController.comment.length,
//                         itemBuilder: (context, index) {
//                           Commentmodel comment =
//                               commentController.comment[index];
//                           return Column(
//                             children: [
//                               ListTile(
//                                 title: Text(comment.user!.firstName!),
//                                 subtitle: Text(comment.body!),
//                               ),
//                               ElevatedButton(
//                                 child: const Text('View Replies'),
//                                 onPressed: () {
//                                   // Fetch replies for the selected comment
//                                   // replyController.fetchReplies(comment.id);

//                                   // // Open the replies page
//                                   Get.to(ReplyPage(comment: comment));
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                       // ),
//                     ),
//                     // Add comment
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         // crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20)),
//                               child: TextFormField(
//                                 maxLines: 2,

//                                 textAlign: TextAlign.start,
//                                 // validator: validator,
//                                 controller:
//                                     commentController.commenteditcontroller,
//                                 keyboardType: TextInputType.text,
//                                 textDirection: TextDirection.rtl,
//                                 style: const TextStyle(
//                                   color: Colors.black87,
//                                 ),
//                                 decoration: const InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                       // borderRadius: BorderRadius.circular(10),
//                                       borderSide: BorderSide(
//                                           color: Color(0xff1ea1a7), width: 1)),
//                                   border: OutlineInputBorder(
//                                       // borderRadius: BorderRadius.circular(10),
//                                       borderSide: BorderSide(
//                                           // color: Color(0xff1ea1a7),
//                                           width: 1)),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Color(0xff1ea1a7))),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Color(0xff1ea1a7), width: 2)),
//                                   errorBorder: OutlineInputBorder(
//                                     borderSide:
//                                         BorderSide(color: Colors.red, width: 2),
//                                     // borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   contentPadding: EdgeInsets.all(12),
//                                   //
//                                   hintText: "اكتب تعليقك هنا",
//                                   hintTextDirection: TextDirection.rtl,
//                                   hintStyle: TextStyle(
//                                     color: Colors.black38,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                               flex: 1,
//                               child: IconButton(
//                                   onPressed: () async {
//                                     Commentmodel newComment = Commentmodel(
//                                         body: commentController
//                                             .commenteditcontroller.text,
//                                         userId: commentController.user.user_id,
//                                         advertisementId: advertisement.id);

//                                     commentController.addComment(newComment);

//                                     // await commentController.addComment({
//                                     //   "body": commentController
//                                     //       .commenteditcontroller.text,
//                                     //   "userId": commentController.user.user_id,
//                                     //   "advertisementId": advertisement.id
//                                     // });
//                                   },
//                                   icon: const Icon(Icons.send)))
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               });
//             }),
//       ),
//     );
//   }
// }



// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // import '../controller/CommentController.dart';
// // import '../model/comment_model.dart';

// // class CommentPage extends StatelessWidget {
// //   final CommentController commentController = Get.put(CommentController());
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Comments')),
// //       body: Obx(
// //         () => ListView.builder(
// //           itemCount: commentController.comments.length,
// //           itemBuilder: (context, index) {
// //             Comment comment = commentController.comments[index];
// //             return ListTile(
// //               title: Text(comment.id.toString()),
// //               subtitle: Text(comment.adveretismentId.toString()),
// //               trailing: Row(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   IconButton(
// //                     icon: Icon(Icons.edit),
// //                     onPressed: () => _showEditDialog(context, index, comment),
// //                   ),
// //                   IconButton(
// //                     icon: Icon(Icons.delete),
// //                     onPressed: () => commentController.deleteComment(index),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.add),
// //         onPressed: () {
// //           showDialog(
// //             context: context,
// //             builder: (context) {
// //               return AlertDialog(
// //                 title: Text('Edit Comment'),
// //                 content: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     TextField(controller: commentController.contentController),
// //                     TextField(controller: commentController.authorController),
// //                   ],
// //                 ),
// //                 actions: [
// //                   TextButton(
// //                     child: Text('Cancel'),
// //                     onPressed: () => Navigator.pop(context),
// //                   ),
// //                   TextButton(
// //                     child: Text('Save'),
// //                     onPressed: () {
// //                       Comment newComment = Comment(
// //                           body: commentController.contentController.text,
// //                           adveretismentId:
// //                               commentController.authorController.text);
// //                       commentController.addComment(newComment);
// //                       Navigator.pop(context);
// //                     },
// //                   ),
// //                 ],
// //               );
// //             },
// //           );
// //           // Comment newComment =
// //           //     Comment(body: 'New Comment', adveretismentId: 'John Doe');
// //           // commentController.addComment(newComment);
// //         },
// //       ),
// //     );
// //   }

// //   void _showEditDialog(BuildContext context, int index, Comment comment) {
// //     TextEditingController contentController =
// //         TextEditingController(text: comment.body);
// //     TextEditingController authorController =
// //         TextEditingController(text: comment.adveretismentId);

// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text('Edit Comment'),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               TextField(controller: contentController),
// //               TextField(controller: authorController),
// //             ],
// //           ),
// //           actions: [
// //             TextButton(
// //               child: Text('Cancel'),
// //               onPressed: () => Navigator.pop(context),
// //             ),
// //             TextButton(
// //               child: Text('Save'),
// //               onPressed: () {
// //                 Comment updatedComment = Comment(
// //                   body: contentController.text,
// //                   adveretismentId: authorController.text,
// //                 );
// //                 commentController.updateComment(index, updatedComment);
// //                 Navigator.pop(context);
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
