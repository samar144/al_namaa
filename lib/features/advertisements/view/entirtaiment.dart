// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../core/widget/appbar.dart';
// import '../../../core/widget/text_form_field.dart';
// import '../../../utils/app_constants.dart';
// import '../../comments_reply/controller/CommentController.dart';
// import '../../comments_reply/controller/replycontroller.dart';
// import '../../comments_reply/model/comment_model.dart';
// import '../../comments_reply/model/reply_model.dart';
// import '../../comments_reply/view/commentpage.dart';
// import '../../comments_reply/view/replypage.dart';
// import '../controller/adscontroller.dart';
// import '../model/advertisement_model.dart';
// import '../model/trainingmodel.dart';

// class EntertaimentAdvertisementPage extends StatelessWidget {
//   EntertaimentAdvertisementPage({super.key});

//   final AdvertisementController advertisementController =
//       Get.put(AdvertisementController());
//   final CommentController commentController = Get.put(CommentController());
//   final ReplyController replyController = Get.put(ReplyController());
//   final RxList<Commentmodel> objectList1 = [
//     Commentmodel(
//       id: "1",
//       body:
//           "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//     ),
//     Commentmodel(
//       id: "2",
//       body:
//           "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//     ),
//     Commentmodel(
//       id: "3",
//       body:
//           "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//     ),
//     Commentmodel(
//       id: "4",
//       body:
//           "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//     ),
//     Commentmodel(
//       id: "5",
//       body:
//           "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//     ),
//     Commentmodel(
//       id: "6",
//       body:
//           "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//     ),
//     Commentmodel(
//       id: "7",
//       body:
//           "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//     ),
//     Commentmodel(
//       id: "8",
//       body:
//           "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//     ),
//   ].obs;

//   @override
//   Widget build(BuildContext context) {
//     // Fetch advertisements when the page is loaded
//     advertisementController.trainiingAdvertisements();

//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: CustomAppBar("ترفيه", []),
//         body: Obx(
//           () => ListView.builder(
//             // itemCount: advertisementController.advertisements.length,
//             itemCount: advertisementController.trainiingadvertisements.length,
//             itemBuilder: (context, index) {
//               var advertisement = TrainingAdvertismentModel.fromJson(
//                   advertisementController.trainiingadvertisements[index]);
//               return Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 10.0, vertical: 10.0),
//                   child: Column(children: [
//                     Container(
//                       height: 250,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(13),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(13),
//                         child: CachedNetworkImage(
//                           imageUrl:
//                               AppConstants.BASE_URL + advertisement.image!,
//                           // placeholder: (context, url) =>
//                           //     CircularProgressIndicator(),
//                           errorWidget: (context, url, error) =>
//                               const Icon(Icons.error),
//                           fit: BoxFit.fill,
//                           width: MediaQuery.sizeOf(context).width,
//                           height: 133,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(advertisement.title!),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Wrap(children: [Text(advertisement.body!)]),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ElevatedButton(
//                             child: const Text('التعليقات '),
//                             onPressed:
//                                 // Fetch comments for the selected advertisement
//                                 // commentController.fetchComments(advertisement.id);

//                                 () {
//                               // // Open the comments page

//                               Get.to(CommentPage(advertisement: advertisement));
//                             }),
//                       ],
//                     ),
//                   ]));
//             },
//           ),
//         ),
//         // Obx(() => Text("${advertisementController.advertisements[0]}"))
//       ),
//     );
//   }
// }
