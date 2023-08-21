import 'package:alnamaa_charity/features/comments_reply/model/comment_model.dart';
import 'package:alnamaa_charity/features/comments_reply/view/replypage.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../advertisements/model/advertisement_model.dart';
import '../controller/CommentController.dart';
import '../controller/replycontroller.dart';

class CommentPage extends StatelessWidget {
  CommentPage({super.key, required this.advertisement});

  final AdvertismentModel advertisement;
  final CommentController commentController = Get.find();
  final ReplyController replyController = Get.put(ReplyController());

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
                      Get.toNamed(GetRoutes.adswithcourse);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.cyan[600],
                    ))),
            body: FutureBuilder<void>(
                future: commentController.fetchcomments(advertisement.id),
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
                                Comment comment =
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
                                      // leading: IconButton(
                                      //   icon: Icon(Icons.edit_note),
                                      //   onPressed: () {
                                      //     // Commentmodel newComment =
                                      //     //     Commentmodel(
                                      //     //         body: commentController
                                      //     //             .commenteditcontroller
                                      //     //             .text,
                                      //     //         userId: commentController
                                      //     //             .user.user_id,
                                      //     //         // user: User(
                                      //     //         //     firstName: commentController
                                      //     //         //         .user.father_name,
                                      //     //         //     lastName: commentController
                                      //     //         //         .user.last_name),
                                      //     //         advertisementId:
                                      //     //             advertisement.id);
                                      //     // commentController
                                      //     //     .commenteditcontroller
                                      //     //     .text = comment.body!;
                                      //     // commentController.edittodo(
                                      //     //     comment.id.toString(),
                                      //     //     newComment);
                                      //   },
                                      // ),
                                    ),
                                    ElevatedButton(
                                      child: const Text('View Replies'),
                                      onPressed: () {
                                        // replyController.fetchReply(comment.id);
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           ReplyPage(comment: comment),
                                        //     ));
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      controller: commentController
                                          .commenteditcontroller,
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
                                          Comment newComment = Comment(
                                              body: commentController
                                                  .commenteditcontroller.text,
                                              userId: commentController
                                                  .user.user_id,
                                              advertisementId:
                                                  advertisement.id);
                                          commentController.addComment(
                                              newComment, advertisement.id);
                                          commentController
                                              .fetchcomments(advertisement.id);
                                        },
                                        icon: const Icon(Icons.send)))
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  );
                })));
  }
}
