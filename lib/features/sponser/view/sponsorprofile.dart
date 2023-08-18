// old
import 'dart:convert';

import 'package:alnamaa_charity/features/Profile/profile_controller.dart';
import 'package:alnamaa_charity/features/Profile/profile_model.dart';
import 'package:alnamaa_charity/features/sponser/controller/sponser_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:alnamaa_charity/utils/colors';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alnamaa_charity/utils/app_constants.dart';

class SponsorProfile extends StatefulWidget {
  SponsorProfile({Key? key}) : super(key: key);

  @override
  _SponsorProfileState createState() => _SponsorProfileState();
}

class _SponsorProfileState extends State<SponsorProfile>
    with SingleTickerProviderStateMixin {
  late HomeController controller;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    controller = Get.put(HomeController());

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        //  Obx(() =>
        GetBuilder<HomeController>(builder: (con) {
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
                onPressed: () {
                  Navigator.of(context).pop();
                }
                // =>
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
                  CircleAvatar(
                    child: Text(controller.sponsorprof.firstName!
                        .substring(0, 1)
                        .toUpperCase()),
                    radius: 60,
                    //     Image.network(
                    //   AppConstants.BASE_URL + controller.prof.orphan!.photo!,
                    //   fit: BoxFit.fill,
                    //   height: 111,
                    //   width: 111,
                    // )
                    //     CachedNetworkImage(
                    //   imageUrl: AppConstants.BASE_URL +
                    //       controller.sponsorprof.photo!,
                    //   placeholder: (context, url) =>
                    //       CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    //   // httpHeaders: {
                    //   //   "Content-Type": "application/json",
                    //   //   "Accept": "application/json",
                    //   //   "Authorization": "Bearer ${AppConstants.TOKEN}"
                    //   // },
                    //   fit: BoxFit.fill,
                    //   width: 133,
                    //   height: 133,
                    // ),
                  ),

                  Align(
                    child: Text(
                        "${controller.sponsorprof.firstName!} ${controller.sponsorprof.lastName!}",
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
                      Tab(text: 'Wallet'),
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
                    subtitle: Text("${controller.sponsorprof.birth!}"),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.school_outlined,
                      color: AppColors.iconColor2,
                    ),
                    title: Text('Study'),
                    subtitle: Text("${controller.sponsorprof.study}"),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.location_city_outlined,
                      color: AppColors.greyColor,
                    ),
                    title: Text('Address'),
                    subtitle: Text(
                        "${controller.sponsorprof.address!.country!} - ${controller.sponsorprof.address!.state!} - ${controller.sponsorprof.address!.city!}- ${controller.sponsorprof.address!.street!} "),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.male_sharp,
                      color: AppColors.iconColor1,
                    ),
                    title: Text("Gender"),
                    subtitle: Text(controller.sponsorprof.gender!),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone_android,
                      color: AppColors.iconColor2,
                    ),
                    title: Text("Phone Number"),
                    subtitle: Text("${controller.sponsorprof.phoneNumber!}"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.numbers,
                      color: AppColors.greyColor,
                    ),
                    title: Text("Sponser Status"),
                    subtitle: controller.sponsorprof.sponsorActive == "1"
                        ? Text("Active")
                        : Text("Not Active"),
                  ),
                  // SizedBox(
                  //   height: 200, // Set a fixed height here
                  //   child: ListView.builder(
                  //     itemCount: controller.sponsorprof.wallets!.length ?? 0,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       var rec_amount = controller.sponsorprof.wallets![index];
                  //       return ListTile(
                  //         leading: Icon(
                  //           Icons.timer_outlined,
                  //           color: AppColors.iconColor1,
                  //         ),
                  //         title: Text(
                  //           'my receipts',
                  //         ),
                  //         subtitle: Text(
                  //             '${rec_amount?.amount ?? ''} / [${rec_amount?.fromDate ?? ''}] - [ ${rec_amount?.toDate ?? ''}]'),
                  //       );
                  //     },
                  //   ),
                  // ),

                  // Add more ListTiles for other sections of your profile
                ],
              ),
              ListView.builder(
                itemCount: controller.sponsorprof.wallets!.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var achievement = controller.sponsorprof.wallets![index];
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
                            "wallet",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          subtitle: Text(
                            "wallet 2",
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
