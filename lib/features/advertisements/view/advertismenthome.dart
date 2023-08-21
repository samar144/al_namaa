import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_constants.dart';
import '../../comments_reply/controller/CommentController.dart';

import '../../comments_reply/controller/replycontroller.dart';
import '../../comments_reply/view/commentpage.dart';
import '../controller/adscontroller.dart';
import '../model/advertisement_model.dart';

class AdvertisementPage extends StatelessWidget {
  AdvertisementPage({super.key});

  final AdvertisementController advertisementController =
      Get.put(AdvertisementController());
  final CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    // Fetch advertisements when the page is loaded
    // advertisementController.checkadvertisementsWithCourse();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            elevation: 2,
            backgroundColor: Colors.white,
            title: Text(
              "الدورات",
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
        body: FutureBuilder(
            future: advertisementController.advertisementsWithCourse(),
            builder: (context, snap) {
              if (!snap.hasData) {
                return Obx(
                  () => ListView.builder(
                    // itemCount: advertisementController.advertisements.length,
                    itemCount:
                        advertisementController.advertisementswithcorse.length,
                    itemBuilder: (context, index) {
                      var advertisement = AdvertismentModel.fromJson(
                          advertisementController
                              .advertisementswithcorse[index]);
                      return advertisement.course!.status == "close"
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: Column(children: [
                                Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: CachedNetworkImage(
                                      imageUrl: AppConstants.BASE_URL +
                                          advertisement.image!,
                                      // placeholder: (context, url) =>
                                      //     CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      fit: BoxFit.fill,
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 133,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(advertisement.title!),
                                const SizedBox(
                                  height: 10,
                                ),
                                Wrap(children: [Text(advertisement.body!)]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        child: const Text('التعليقات '),
                                        onPressed: () {
                                          // Fetch comments for the selected advertisement

                                          commentController
                                              .fetchcomments(advertisement.id);

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CommentPage(
                                                        advertisement:
                                                            advertisement),
                                              ));
                                        }),
                                  ],
                                ),
                              ]))
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(13),
                                      child: CachedNetworkImage(
                                        imageUrl: AppConstants.BASE_URL +
                                            advertisement.image!,
                                        // placeholder: (context, url) =>
                                        //     CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        fit: BoxFit.fill,
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 133,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(advertisement.title!),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(children: [Text(advertisement.body!)]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          child: const Text('التعليقات '),
                                          onPressed: () {
                                            // Fetch comments for the selected advertisement
                                            commentController.fetchcomments(
                                                advertisement.id);
                                            // // Open the comments page

                                            Get.to(CommentPage(
                                                advertisement: advertisement));
                                          }),
                                      ElevatedButton(
                                        child: const Text('تسجيل في الدورة'),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
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
