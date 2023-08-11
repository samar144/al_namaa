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
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWJhYTlhMDJhNDMxNzJmNDI2NTA3ZTg4YTkyYTAzZTg3ZjI0MzMxNzFhNDg0ZmYwNjliNTcxZTNhN2FlZWRiNmU5NDY3OWMwN2RjMjE4NmEiLCJpYXQiOjE2OTE3MjYzNDUuOTI1NzA3LCJuYmYiOjE2OTE3MjYzNDUuOTI1NzEyLCJleHAiOjE3MjMzNDg3NDUuODU3MDYyLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.FVttJM9JB91fAg4gpshQKDGVgw7Ipe-H7J3uBSIaE9o5Gt4gw3mVcrRpX-eckIIqZ4w0-nXkOmoRxuv8_cpDux2DW3qszL_unN7j6sMKCGujbxx43FQxYEJpQxTv3Q79vZ6D-G_ic4FC7AIaZt2hIKulqxEnP1B_3BC9b9Q4tUaQwgnJzKaJ_5X9qwOi_b7OzcoTitmXjrHGr9UAK2chuVLdAswo2vb62vBV9KW5jOkO3G3TuMq7NPefed-LYqtHSi2q5-hW52TvMObpl5X3Mu22V5haBfui_InFbU-eA8dUgrjpeu7udKhCwo-GLvr2DwiAvFZNOohrTe904BprunfVWL7Sl6PQXI-flSZHhAHT4Md_R2dedgzwZWCjOtJqRCewt5eOS-2u7LqRqf1pWJce1pKe_9brRQBQQ9CWlPhdt6DUfbTXBeje7jvm3AAjIB9FASNXlvs00DUM6pbmdXEIgvuAtim2bbZLve-WXhVqnBesiEGPv17zuFcL6JkJfQXc-lyzGbSpU5yz8KBNb4XwcMxL4uWKYmQn58E6ekoITbq_-_t0xmC8ZdI7OdVq12uCgFIT3wQ--Y5o10tImGemidtLGj4NwQrSouUo2jQlKcowIofshaNwUakM0r6n5ePi7zkR38fHCom9A538AvzPY_BDcxoKte9My_tg2Ic";
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
                  Row(children: [
                    Text(
                      'my receipts',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColors.mainColor),
                    ),
                  ]),
                  SizedBox(
                    height: 200,
                    child:
                        // ListView.builder(
                        //   itemCount: controller.prof.receipt?.length ?? 0,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     var rec_amount = controller.prof.receipt?[index];
                        //     return ListTile(
                        //       leading: Icon(
                        //         Icons.timer_outlined,
                        //         color: AppColors.iconColor1,
                        //       ),
                        //       title: Text(
                        //         'my receipts',
                        //       ),
                        //       subtitle: Text(
                        //           '${rec_amount?.amount ?? ''} / [${rec_amount?.fromDate ?? ''}] - [ ${rec_amount?.toDate ?? ''}]'),
                        //     );
                        //   },
                        // ),
                        ListView.builder(
                      itemCount: controller.prof.receipt?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        var rec_amount = controller.prof.receipt?[index];
                        List<Color> colors = [
                          AppColors.conColor1,
                          AppColors.conColor2,
                          AppColors.conColor3,
                          AppColors.conColor4,
                          AppColors.conColor5,
                        ];

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
                                    colors[index % colors.length],
                                    AppColors.containerColor
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
                                  Icons.timer_outlined,
                                  color: AppColors.iconColor2,
                                ),
                                title: Text(
                                  'my receipts',
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                subtitle: Text(
                                  '${rec_amount?.amount ?? ''} / [${rec_amount?.fromDate ?? ''}] - [ ${rec_amount?.toDate ?? ''}]',
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                  ),
                                ),
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
                  ),
                ],
              ),
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
