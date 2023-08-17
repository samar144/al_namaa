// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:alnamaa_charity/features/Profile/profile_controller.dart';
import 'package:alnamaa_charity/features/Profile/profile_model.dart';
import 'package:alnamaa_charity/routes.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWM5NDQ0MTE1Yjc2MDJjNTNlNWJkZDU1YTRmZjkzY2UyYTIwMDBlYjRjYTk5NDJmYmRkNTFhZjA5ZTdlNjJlMDQ4YTQ3ZmNkYWU4ZTk2MzYiLCJpYXQiOjE2OTIwODI5MjguOTczNTcxLCJuYmYiOjE2OTIwODI5MjguOTczNTc1LCJleHAiOjE3MjM3MDUzMjguOTE3OTUzLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.KJGP4Vm_qM_VHrn9E9A8MuGpwD4UchkLFWTjsqh4yqhJzCRNOxlZ_-DAStWjZnPw4BbalieN0ebAm4U2pt23LeVFnyp9lMIFYpEu7VQkj5H3rgadUwuYxlcUXHKdp5KbvVyD8MzJgfrg2J21SGTc3HAjbr-LrdvGFeWD6R48Mufcm2k37WjGL8n-oFw6eEnS7gbJBnYKaYjpso4JwyGgh3_DiEbFtFIm-k1M2vzom1oEkqxbQtMYp0VDIazvAWZmfghMfvIWyQ5GJ6cesK3BQ_w1pfSyB5trCaMIjDVRJSP4nWPEvVz-5ZyoVmmGu7IvjlTCxkN8uXVQPKMkySPREZL-yGJbxq89aNFoK_J-Mqzb1cCFsq1F0vKitke124EEuo-Wb906weGEcoeMvn1NPAqebrxFXyOe4pKTzHpZJqVJDmRCpHIZZ4jhPmLBx0HRxG-Oxllqxn-GT0Uvjrnory6x6rM0hokJzGm6jR8LAz-qT33AJU0WKAVtAirPbzBJrmDfN-Z5U-dbAjMG0xbEEjhuo4UdE9pLTIeX6_jrKePSAG0n33oiD0xeIiPrykemx4GT7qfCCk5w-bVHqgwLymXoevw_nV3yqLLaLaZ14QjkrOZ_Ca3ZiHMPcKcznq9Vg9hawIcBEQLhbUcNLs1fthuMhhFeos0RcOZHe7s5DSc";
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
                  Get.toNamed(GetRoutes.myorphanes);
                }),
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
                  ClipOval(
                    child: controller.prof.orphan != null
                        ? CachedNetworkImage(
                            imageUrl: AppConstants.BASE_URL +
                                controller.prof.orphan!.photo!,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            httpHeaders: {
                              "Content-Type": "application/json",
                              "Accept": "application/json",
                              "Authorization": "Bearer $token"
                            },
                            fit: BoxFit.fill,
                            width: 133,
                            height: 133,
                          )
                        : SizedBox(), // Add a fallback widget or an empty SizedBox if orphan is null
                  ),

                  Align(
                    child: Text(
                        "${controller.prof.orphan?.firstName ?? ''} ${controller.prof.orphan?.lastName ?? ''}",
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
              ListView.builder(
                itemCount: 6, // Number of sections/categories
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    // Birth section
                    return ListTile(
                      leading: Icon(
                        Icons.date_range_outlined,
                        color: AppColors.iconColor1,
                      ),
                      title: Text("Birth"),
                      subtitle: Text("${controller.prof.orphan!.birth!}"),
                    );
                  } else if (index == 1) {
                    // Study & School section
                    return ListTile(
                      leading: Icon(
                        Icons.school_outlined,
                        color: AppColors.iconColor2,
                      ),
                      title: Text('Study & School'),
                      subtitle: Text(
                          "${controller.prof.orphan!.study!} - ${controller.prof.orphan!.schoolName!} school "),
                    );
                  } else if (index == 2) {
                    // National Number section
                    return ListTile(
                      leading: Icon(
                        Icons.numbers_outlined,
                        color: AppColors.mainBlackColor,
                      ),
                      title: Text('National Number'),
                      subtitle:
                          Text("${controller.prof.orphan!.nationalNumber!} "),
                    );
                  } else if (index == 3) {
                    // Address section
                    return ListTile(
                      leading: Icon(
                        Icons.location_city_outlined,
                        color: AppColors.greyColor,
                      ),
                      title: Text('Address'),
                      subtitle: Text(
                          "${controller.prof.address!.country!} - ${controller.prof.address!.state!} - ${controller.prof.address!.city!}- ${controller.prof.address!.street!} "),
                    );
                  } else if (index == 4) {
                    // Gender section
                    return ListTile(
                      leading: Icon(
                        Icons.person_2_outlined,
                        color: AppColors.conColor1,
                      ),
                      title: Text('Gender'),
                      subtitle: Text("${controller.prof.orphan!.gender!} "),
                    );
                  } else if (index == 5) {
                    // Gender section
                    return SizedBox(
                      height: 200,
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
                              'My Receipts',
                            ),
                            subtitle: Text(
                                '${rec_amount?.amount ?? ''} / [${rec_amount?.fromDate ?? ''}] - [ ${rec_amount?.toDate ?? ''}]'),
                          );
                        },
                      ),
                    );
                  }
                  return SizedBox
                      .shrink(); // Return an empty widget if index is out of bounds
                },
              ),
              Stack(children: [
                Container(
                  width: 333,
                  height: 333,
                  padding: EdgeInsets.all(99),
                  margin: EdgeInsets.all(99),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    // ignore: prefer_const_constructors
                    image: DecorationImage(
                      // ignore: prefer_const_constructors
                      image: AssetImage(
                          "assets/images/photo_2023-08-10_00-35-19.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: controller.prof.achievements?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    var achievement = controller.prof.achievements?[index];
                    return Container(
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
                    );
                  },
                ),
              ]),
            ],
          ),
        ),
      );
    });
    // );
  }
}
