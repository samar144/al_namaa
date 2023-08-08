import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/appbar.dart';
import '../../../core/widget/text_form_field.dart';
import '../../comments_reply/controller/CommentController.dart';
import '../../comments_reply/controller/replycontroller.dart';
import '../../comments_reply/model/comment_model.dart';
import '../../comments_reply/model/reply_model.dart';
import '../../comments_reply/view/commentpage.dart';
import '../../comments_reply/view/replypage.dart';
import '../controller/adscontroller.dart';
import '../model/advertisement_model.dart';

class AdvertisementPage extends StatelessWidget {
  AdvertisementPage({super.key});

  final AdvertisementController advertisementController =
      Get.put(AdvertisementController());
  final CommentController commentController = Get.put(CommentController());
  final ReplyController replyController = Get.put(ReplyController());
  RxList<Commentmodel> objectList1 = [
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

  List<AdvertismentModel> objectList = [
    AdvertismentModel(
      id: "1",
      title: "Item 1",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      image: "children-group-drawing.jpg",
      hint: "Hint 1",
    ),
    AdvertismentModel(
      id: "2",
      title: "Item 2",
      body:
          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "schoolchild-sitting-desk-living-room-holding-school-book.jpg",
      hint: "schoolchild-sitting-desk-living-room-holding-school-book.jpg",
    ),
    AdvertismentModel(
      id: "3",
      title: "Item 3",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      image: "children-group-drawing.jpg",
      hint: "Hint 3",
    ),
    AdvertismentModel(
      id: "4",
      title: "Item 4",
      body:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      image: "schoolchild-sitting-desk-living-room-holding-school-book.jpg",
      hint: "Hint 4",
    ),
    AdvertismentModel(
      id: "5",
      title: "Item 5",
      body:
          "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      image: "close-up-classmates-playing-with-laptop.jpg",
      hint: "Hint 5",
    ),
    AdvertismentModel(
      id: "6",
      title: "Item 6",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      image: "children-group-drawing.jpg",
      hint: "Hint 6",
    ),
    AdvertismentModel(
      id: "7",
      title: "Item 7",
      body:
          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "schoolchild-sitting-desk-living-room-holding-school-book.jpg",
      hint: "Hint 7",
    ),
    AdvertismentModel(
      id: "8",
      title: "Item 8",
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      image: "little-kids-using-laptops-school.jpg",
      hint: "Hint 8",
    ),
    AdvertismentModel(
      id: "9",
      title: "Item 9",
      body:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      image: "close-up-classmates-playing-with-laptop.jpg",
      hint: "Hint 9",
    ),
    AdvertismentModel(
      id: "10",
      title: "Item 10",
      body:
          "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      image: "schoolchild-sitting-desk-living-room-holding-school-book.jpg",
      hint: "Hint 10",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Fetch advertisements when the page is loaded
    // advertisementController.fetchAdvertisements();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar("الاعلانات", []),
        body:
            // Obx(
            //   () =>
            ListView.builder(
          // itemCount: advertisementController.advertisements.length,
          itemCount: objectList.length,
          itemBuilder: (context, index) {
            AdvertismentModel advertisement = objectList[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/${advertisement.image}"))),
                    child: Center(
                      child: Text(
                        advertisement.title,
                        style: const TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(children: [Text(advertisement.body)]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          child: const Text('التعليقات '),
                          onPressed:
                              // Fetch comments for the selected advertisement
                              // commentController.fetchComments(advertisement.id);

                              // // Open the comments page
                              // Get.to(CommentPage(advertisement: advertisement));
                              () {
                            Get.bottomSheet(Container(
                              height: MediaQuery.sizeOf(context).height / 2,
                              child: Column(
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
                                        Commentmodel comment =
                                            objectList1[index];
                                        return Column(
                                          children: [
                                            ListTile(
                                              title:
                                                  Text(comment.id.toString()),
                                              subtitle: Text(comment.body!),
                                            ),
                                            ElevatedButton(
                                              child: Text('View Replies'),
                                              onPressed: () {
                                                // Fetch replies for the selected comment
                                                // replyController.fetchReplies(comment.id);

                                                // // Open the replies page
                                                Get.to(ReplyPage(
                                                    comment: comment));
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            3,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Text(
                                                              "اضافة تعليق"),
                                                          const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Icon(Icons
                                                                  .warning_outlined),
                                                              Text(
                                                                  "الرجاء ذكر السبب "),
                                                            ],
                                                          ),
                                                          TextFormFieldWidget(
                                                            label: "",
                                                            controller:
                                                                commentController
                                                                    .contentController,
                                                            maxlines: 5,
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .cyan),
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  child: const Text(
                                                                      "رجوع")),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  // objectList.add(Commentmodel(
                                                                  //     id: "9",
                                                                  //     body: commentController
                                                                  //         .contentController.text));
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors.red),
                                                                child:
                                                                    const Text(
                                                                        "تأكيد"),
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
                            ));
                          }),
                      // ElevatedButton(
                      //   child: Text('تعليق'),
                      //   onPressed: () {
                      //     // Fetch comments for the selected advertisement
                      //     // commentController.fetchComments(advertisement.id);

                      //     // // Open the comments page
                      //     // Get.to(CommentPage(advertisement: advertisement));
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        // ),
      ),
    );
  }
}



// class AdsHome extends StatelessWidget {
//   AdsHome({super.key});
//   final AdsController controller = Get.put(AdsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: CustomAppBar("الأعلانات", []),
//         body: FutureBuilder<void>(
//             future: controller.getads(),
//             builder: (context, snapshot) {
//               return Obx(() {
//                 final data = controller.ads;
//                 return ListView.builder(
//                     itemCount: data.length,
//                     itemBuilder: ((context, index) {
//                       final item = data[index];
//                       return Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(13),
//                             image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: AssetImage(item.image))),
//                         child: Center(
//                           child: Text(
//                             item.title,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 backgroundColor: Colors.black45,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20),
//                           ),
//                         ),
//                       );
//                     }));
//               });
//             }));
//   }
// }

// import 'package:alnamaa_charity/core/widget/appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controller/adscontroller.dart';

// class AdsHome extends StatelessWidget {
//   AdsHome({super.key});
//   final AdsController controller = Get.put(AdsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar("الأعلانات", []),
//       body: GetBuilder<AdsController>(builder: (contrpller) {
//         return SingleChildScrollView(
//           child: ListView.separated(
//               itemBuilder: ((context, i) {
//                 return Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(13),
//                       image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage(controller.ads[i].image))),
//                   child: Center(
//                     child: Text(
//                       controller.ads[i].title,
//                       style: TextStyle(
//                           color: Colors.white,
//                           backgroundColor: Colors.black45,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20),
//                     ),
//                   ),
//                 );
//               }),
//               separatorBuilder: (context, i) {
//                 return Divider();
//               },
//               itemCount: controller.ads.length),
//         );
//       }),
//     );
//   }
// }
