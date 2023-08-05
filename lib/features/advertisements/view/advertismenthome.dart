import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comments_reply/controller/CommentController.dart';
import '../../comments_reply/controller/replycontroller.dart';
import '../../comments_reply/view/commentpage.dart';
import '../controller/adscontroller.dart';
import '../model/advertisement_model.dart';

class AdvertisementPage extends StatelessWidget {
  final AdvertisementController advertisementController =
      Get.put(AdvertisementController());
  final CommentController commentController = Get.put(CommentController());
  final ReplyController replyController = Get.put(ReplyController());

  AdvertisementPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch advertisements when the page is loaded
    advertisementController.fetchAdvertisements();

    return Scaffold(
      appBar: AppBar(title: Text('Advertisements')),
      body: Obx(
        () => ListView.builder(
          itemCount: advertisementController.advertisements.length,
          itemBuilder: (context, index) {
            AdvertismentModel advertisement =
                advertisementController.advertisements[index];
            return Column(
              children: [
                Container(
                  // Display advertisement image and text
                  child: Text(advertisement.body),
                ),
                ElevatedButton(
                  child: Text('View Comments'),
                  onPressed: () {
                    // Fetch comments for the selected advertisement
                    commentController.fetchComments(advertisement.id);

                    // Open the comments page
                    Get.to(CommentPage(advertisement: advertisement));
                  },
                ),
              ],
            );
          },
        ),
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
