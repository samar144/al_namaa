// ignore_for_file: prefer_const_constructors

import 'package:alnamaa_charity/core/widget/customicon.dart';
import 'package:alnamaa_charity/core/widget/icon_and_text_widget.dart';
import 'package:alnamaa_charity/core/widget/text_form_field.dart';

import 'package:alnamaa_charity/features/sponser/controller/sponser_home_controller.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:alnamaa_charity/utils/baseurl.dart';
import 'package:alnamaa_charity/utils/colors';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCourses extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWM5NDQ0MTE1Yjc2MDJjNTNlNWJkZDU1YTRmZjkzY2UyYTIwMDBlYjRjYTk5NDJmYmRkNTFhZjA5ZTdlNjJlMDQ4YTQ3ZmNkYWU4ZTk2MzYiLCJpYXQiOjE2OTIwODI5MjguOTczNTcxLCJuYmYiOjE2OTIwODI5MjguOTczNTc1LCJleHAiOjE3MjM3MDUzMjguOTE3OTUzLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.KJGP4Vm_qM_VHrn9E9A8MuGpwD4UchkLFWTjsqh4yqhJzCRNOxlZ_-DAStWjZnPw4BbalieN0ebAm4U2pt23LeVFnyp9lMIFYpEu7VQkj5H3rgadUwuYxlcUXHKdp5KbvVyD8MzJgfrg2J21SGTc3HAjbr-LrdvGFeWD6R48Mufcm2k37WjGL8n-oFw6eEnS7gbJBnYKaYjpso4JwyGgh3_DiEbFtFIm-k1M2vzom1oEkqxbQtMYp0VDIazvAWZmfghMfvIWyQ5GJ6cesK3BQ_w1pfSyB5trCaMIjDVRJSP4nWPEvVz-5ZyoVmmGu7IvjlTCxkN8uXVQPKMkySPREZL-yGJbxq89aNFoK_J-Mqzb1cCFsq1F0vKitke124EEuo-Wb906weGEcoeMvn1NPAqebrxFXyOe4pKTzHpZJqVJDmRCpHIZZ4jhPmLBx0HRxG-Oxllqxn-GT0Uvjrnory6x6rM0hokJzGm6jR8LAz-qT33AJU0WKAVtAirPbzBJrmDfN-Z5U-dbAjMG0xbEEjhuo4UdE9pLTIeX6_jrKePSAG0n33oiD0xeIiPrykemx4GT7qfCCk5w-bVHqgwLymXoevw_nV3yqLLaLaZ14QjkrOZ_Ca3ZiHMPcKcznq9Vg9hawIcBEQLhbUcNLs1fthuMhhFeos0RcOZHe7s5DSc";
      return DefaultTabController(
        length: 3,
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
                  Get.toNamed(GetRoutes.orphanhomepage);
                }),
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'دوراتي',
                style: TextStyle(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromRadius(33),
              child: Column(
                children: [
                  TabBar(
                    // controller: _tabController,
                    tabs: const [
                      Tab(text: 'Active Courses'),
                      Tab(text: 'Finished Courses'),
                      Tab(text: 'Waiting Courses'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            //controller: _tabController,
            children: [
              ListView.builder(
                itemCount: controller.activeCourses?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var active = controller.activeCourses?[index];
                  List<Color> colors = [
                    Color(0xFFA2D9CE),
                    Color(0xFFD6DBDF),
                    Color(0xFFF5B7B1),
                    Color(0xFFD2B4DE),
                    Color(0xFFAED6F1),
                  ];
                  return Container(
                    width: 450,
                    height: 250,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            colors[index % colors.length],
                            colors[index % colors.length],
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0XFFe8e8e8),
                              blurRadius: 5.0,
                              offset: Offset(0, 5)),
                          BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                        ]),
                    child: Row(children: [
                      Container(
                        width: 158,
                        height: 158,
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            //   color: const Color.fromARGB(255, 241, 214, 246),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/personal growth-cuate.png"))),
                      ),
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            // color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                title: Text(
                                  "${active?.name ?? ''}",
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      '  تبدأ ب  ${active?.startDate ?? ''}',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      ' تنتهي ب  ${active?.endDate ?? ''} ',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      ' الفئة العمرية ${active?.targetGroup ?? ''}',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text:
                                              '${active?.sessionNumber ?? ''}',
                                          iconColor: AppColors.greyColor,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.person_4_rounded,
                                          text: ' ${active?.trainerName ?? ''}',
                                          iconColor: AppColors.iconColor2,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text:
                                              '${active?.sessionDuration ?? ''} ',
                                          iconColor: AppColors.iconColor1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  );
                },
              ),
              ListView.builder(
                itemCount: controller.finishedCourses?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var finish = controller.finishedCourses?[index];
                  List<Color> colors = [
                    Color(0xFFA2D9CE),
                    Color(0xFFD6DBDF),
                    Color(0xFFF5B7B1),
                    Color(0xFFD2B4DE),
                    Color(0xFFAED6F1),
                  ];
                  return Container(
                    width: 450,
                    height: 250,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            colors[index % colors.length],
                            colors[index % colors.length],
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0XFFe8e8e8),
                              blurRadius: 5.0,
                              offset: Offset(0, 5)),
                          BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                        ]),
                    child: Row(children: [
                      Container(
                        width: 158,
                        height: 158,
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            //   color: const Color.fromARGB(255, 241, 214, 246),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/personal growth-cuate.png"))),
                      ),
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            // color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                title: Text(
                                  "${finish?.name ?? ''}",
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      '  تبدأ ب  ${finish?.startDate ?? ''}',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      ' تنتهي ب  ${finish?.endDate ?? ''} ',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      ' الفئة العمرية ${finish?.targetGroup ?? ''}',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text:
                                              '${finish?.sessionNumber ?? ''}',
                                          iconColor: AppColors.greyColor,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.person_4_rounded,
                                          text: ' ${finish?.trainerName ?? ''}',
                                          iconColor: AppColors.iconColor2,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text:
                                              '${finish?.sessionDuration ?? ''} ',
                                          iconColor: AppColors.iconColor1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  );
                },
              ),
              ListView.builder(
                itemCount: controller.waitingCourses?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var wait = controller.waitingCourses?[index];
                  List<Color> colors = [
                    Color(0xFFA2D9CE),
                    Color(0xFFD6DBDF),
                    Color(0xFFF5B7B1),
                    Color(0xFFD2B4DE),
                    Color(0xFFAED6F1),
                  ];
                  return Container(
                    width: 450,
                    height: 250,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            colors[index % colors.length],
                            colors[index % colors.length],
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0XFFe8e8e8),
                              blurRadius: 5.0,
                              offset: Offset(0, 5)),
                          BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                        ]),
                    child: Row(children: [
                      Container(
                        width: 158,
                        height: 158,
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            //   color: const Color.fromARGB(255, 241, 214, 246),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/personal growth-cuate.png"))),
                      ),
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            // color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                title: Text(
                                  "${wait?.name ?? ''}",
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      '  تبدأ ب  ${wait?.startDate ?? ''}',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      ' تنتهي ب  ${wait?.endDate ?? ''} ',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      ' الفئة العمرية ${wait?.targetGroup ?? ''}',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: '${wait?.sessionNumber ?? ''}',
                                          iconColor: AppColors.greyColor,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.person_4_rounded,
                                          text: ' ${wait?.trainerName ?? ''}',
                                          iconColor: AppColors.iconColor2,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text:
                                              '${wait?.sessionDuration ?? ''} ',
                                          iconColor: AppColors.iconColor1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
