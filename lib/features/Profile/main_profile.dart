// old
import 'dart:convert';

import 'package:alnamaa_charity/features/Profile/profile_controller.dart';
import 'package:alnamaa_charity/features/Profile/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:alnamaa_charity/utils/colors';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alnamaa_charity/utils/app_constants.dart';

class MainProfile extends StatefulWidget {
  MainProfile({Key? key}) : super(key: key);

  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ProfileController con = Get.put(ProfileController());

  //late String imageUrl;
  // final ProfileModel userData = ProfileModel.fromJson(json.decode(response.body).toString());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // fetchImageUrl();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Future<void> fetchImageUrl() async {
  //   try {
  //     final url = await getImageUrlFromApi();
  //     setState(() {
  //       imageUrl = url;
  //     });
  //   } catch (e) {
  //     // Handle error
  //   }
  // }

  // Future<String> getImageUrlFromApi() async {
  //   final response = await http.get(
  //       Uri.parse('http://127.0.0.1:8000/api/app/orphans/profile/5/photo'));
  //   if (response.statusCode == 200) {
  //     final imageUrl = response.body;
  //     return imageUrl;
  //   } else {
  //     throw Exception('Failed to load image URL');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return
        //  Obx(() =>
        GetBuilder<ProfileController>(builder: (controller) {
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTMwOTYwNGFmZTk0NWExYTliMzZmOGI0NTU1M2Q1MDM4ZTYwNTc3ZjRlYTZiOTQxMGZkY2ExZmJkMDQ3MjBjOGJhNDEzYzZlN2NkM2I5MDQiLCJpYXQiOjE2OTE1NjU1NjMuNTQ0NTI4LCJuYmYiOjE2OTE1NjU1NjMuNTQ0NTMyLCJleHAiOjE3MjMxODc5NjMuNTE5ODM3LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.BJ2CoNSa3ptkUTlo1baTbDm8JUyNqAQ-2FY8nNgkDQ84FDx3B6PA-kDP56ro23ThJipAGIv_WGmlyDZ9ekazW11Ol-kzUp62GzzhEMi8WdR7fUrgbkKszFTs3NJgxrQDAR8tCsKyyrYuMQIVe2La0R-cS26xVZisWoIgfyJ8kdIETe3WM5rRRVSzlfDxUClW9ez-v9WvIPytaSXanazCys3FrRmwPhY5tzpKKxUldv6scyFQ0zLh97YOy8g2VebCADXVe9J3jfGdraZEKCEKfGpe9ZnSZYBawDJIJb1eTse0ZlFeRty4uY6unPVBjmxdoaE17isMGCvEoPr0Jv1TklF9pMspweEwhVjP35tPnydwumSQuOQ3B_G1zrxFitIBS_A72VZHGPXTwxyBf2wZUejLhWgquGKIW4CzcF7JUHzKYH32JK5YyuM9-8g0jCoU_TlITA0oUIQCs5twceeOWGZgwkfrXgmKXqf50VeavaD5urkY3k564yMpsVvhmJph9GosXNTtllnbsy5ut6NYiB-1hs9vAu1ashXXNr2Zg0agyH3aptQDufsYjzrvu30sgfSy13kZhpfGay12xuYOVYytj7lXldsSl1wXOkq7KDwRo5QIz5l2byWFmgrs2fpjXj2t85o5SxFo6fgd2giqIIRDiD3e-glATPqd4ZSmT4w";
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColors.mainColor,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                ),
                onPressed: () {}
                // =>
                // Navigator.of(context).pop(),
                ),
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'الملف الشخصي',
                style: TextStyle(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromRadius(133),
              child: Column(
                children: [
                  // Container(
                  //   height: 111,
                  //   width: 111,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/images/33.jpg"),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),

                  // //   const CachedNetworkImageProvider( " http://127.0.0.1:8000/images/orphans/lA5e5q0MTvPl3bdwQz9HKBlPoR7E98GwLdcZcYX3.jpg"),

                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: AppConstants.BASE_URL +
                          controller.prof.orphan!.photo!,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      httpHeaders: {
                        "Content-Type": "application/json",
                        "Accept": "application/json",
                        "Authorization": "Bearer $token"
                      },
                      fit: BoxFit.fill,
                      width: 133,
                      height: 133,
                    ),
                  ),

                  Align(
                    child: Text(
                        "${controller.prof.orphan?.firstName!} ${controller.prof.orphan?.lastName!}",
                        style: const TextStyle(
                            color: Color.fromRGBO(50, 50, 93, 1),
                            fontSize: 26.0)),
                  ),
                  const SizedBox(height: 10.0),

                  const Divider(
                    height: 40.0,
                    thickness: 1.5,
                    indent: 32.0,
                    endIndent: 32.0,
                  ),

                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'About'),
                      Tab(text: 'Achievements'),
                    ],
                  ),
                  // Profile photo
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.date_range_outlined,
                      color: AppColors.iconColor1,
                    ),
                    title: Text("Birth"),
                    subtitle: Text("${controller.prof.orphan!.birth!}"),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.school_outlined,
                      color: AppColors.iconColor2,
                    ),
                    title: Text('Study & Scool'),
                    subtitle: Text(
                        "${controller.prof.orphan!.study!} - ${controller.prof.orphan!.schoolName!} school "),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.numbers_outlined,
                      color: AppColors.mainBlackColor,
                    ),
                    title: Text('National Number'),
                    subtitle:
                        Text("${controller.prof.orphan!.nationalNumber!} "),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_city_outlined,
                      color: AppColors.greyColor,
                    ),
                    title: Text('Adress'),
                    subtitle: Text(
                        "${controller.prof.address!.country!} - ${controller.prof.address!.state!} - ${controller.prof.address!.city!}- ${controller.prof.address!.street!} "),
                  ),
                  SizedBox(
                    height: 200, // Set a fixed height here
                    child: ListView.builder(
                      itemCount: controller.prof.receipt?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        var rec_amount = controller.prof.receipt?[index];
                        return ListTile(
                          leading: Icon(
                            Icons.timer_outlined,
                            color: AppColors.iconColor1,
                          ),
                          title: Text(
                            'my receipts',
                          ),
                          subtitle: Text(
                              '${rec_amount?.amount ?? ''} / [${rec_amount?.fromDate ?? ''}] - [ ${rec_amount?.toDate ?? ''}]'),
                        );
                      },
                    ),
                  ),

                  // Add more ListTiles for other sections of your profile
                ],
              ),

              // Center(
              //   child: Padding(
              //     padding: EdgeInsets.all(16.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "${controller.prof.address!.country!} ${controller.prof.address!.city!}",
              //           style: TextStyle(fontSize: 18),
              //         ),
              //         SizedBox(height: 10),
              //         Text(
              //           "${controller.prof.orphan!.birth!}",
              //           style: TextStyle(fontSize: 18),
              //         ),
              //         SizedBox(height: 10),
              //         Text(
              //           "${controller.prof.orphan!.study!}",
              //           style: TextStyle(fontSize: 18),
              //         ),
              //         SizedBox(height: 10),
              //         Text(
              //           "${controller.prof.orphan!.status!}",
              //           style: TextStyle(fontSize: 18),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              ListView.builder(
                itemCount: controller.prof.achievements?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var achievement = controller.prof.achievements?[index];
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(33),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.mainColor,
                              AppColors.containerColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          title: Text(
                            "${achievement?.title ?? ''}    2023-08-09T07:18:57.000000Z",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          subtitle: Text(
                            "${achievement?.createdAt ?? ''}-${achievement?.body ?? ''}",
                            style: TextStyle(
                              color: AppColors.mainColor,
                            ),
                          ),

                          //trailing: Text("${achievement?.createdAt ?? ''}-${achievement?.body ?? ''}"),
                        ),
                      ),
                      Container(
                        width: 333,
                        height: 333,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/photo_2023-08-10_00-35-19.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
    // );
  }
}

//   Widget _builldProfile(ProfileModel profileModel) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: AppColors.whiteColor,
//         appBar: AppBar(
//           elevation: 0.0,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: AppColors.whiteColor,
//             ),
//             onPressed: () {}
//             // =>
//             // Navigator.of(context).pop(),
//           ),
//           title: Align(
//             child: Text(
//               'الملف الشخصي',
//               style: TextStyle(
//                 color: AppColors.whiteColor,
//               ),
//             ),
//             alignment: Alignment.center,
//           ),
//           bottom: PreferredSize(
//             preferredSize: const Size.fromRadius(133),
//             child: Column(
//               children: [
//                 Container(
//                   height: 111,
//                   width: 111,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/33.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),

//                 //CachedNetworkImageProvider(imageUrl),
//                 // CachedNetworkImage(
//                 //     imageUrl:
//                 //         AppConstants.BASE_URL+'/api/app/orphans/profile/'+Orphan.id,
//                 //     placeholder: (context, url) =>
//                 //         CircularProgressIndicator(),
//                 //     errorWidget: (context, url, error) => Icon(Icons.error),
//                 //   ),
//                 Align(
//                   child: Text(
//                       con.prof.value.orphan!.firstName! +
//                           " " +
//                           con.prof.value.orphan!.age!,
//                       style: TextStyle(
//                           color: Color.fromRGBO(50, 50, 93, 1),
//                           fontSize: 26.0)),
//                 ),
//                 SizedBox(height: 10.0),
//                 Align(
//                   child: Text(
//                       con.prof.value.address!.country! +
//                           " " +
//                           con.prof.value.address!.city!,
//                       style: TextStyle(
//                           color: Color.fromRGBO(50, 50, 93, 1),
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w200)),
//                 ),
//                 Divider(
//                   height: 40.0,
//                   thickness: 1.5,
//                   indent: 32.0,
//                   endIndent: 32.0,
//                 ),

//                 TabBar(
//                   controller: _tabController,
//                   tabs: const [
//                     Tab(text: 'About'),
//                     Tab(text: 'Achievements'),
//                   ],
//                 ),
//                 // Profile photo
//               ],
//             ),
//           ),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: const [
//             Center(
//                 child: Column(
//               children: [
//                 Text('About'),
//               ],
//             )),
//             Center(child: Text('Achievements')),
//           ],
//         ),
//       ),
//     );
//   }
// }