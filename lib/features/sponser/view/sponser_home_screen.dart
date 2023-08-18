import 'package:alnamaa_charity/core/widget/customicon.dart';
import 'package:alnamaa_charity/features/auth/signup/model/user_register_model.dart';
import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/widget/custom_list_tile.dart';
import '../../../core/widget/drawer.dart';
import '../../../routes.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../controller/sponser_home_controller.dart';

class SponserHomePage extends StatelessWidget {
  SponserHomePage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();
  final HomeController controller = Get.put(HomeController());
  UserModel? user = GetStorageUtils().getUser();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey1,
        appBar: AppBar(
          toolbarHeight: 80,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.cyan[600],
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 2,
          title: Text(
            "النماء",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan[600]),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              scaffoldKey1.currentState!.openDrawer();
            },
            icon: CircleAvatar(child: Text(user!.name!.substring(0, 1))),
          ),
        ),
        drawer: MyDrawer(
            name: user!.name!,
            image: "images/1.png",
            email: user!.email!,
            listTile: [
              CustomListTile(
                icon: const Icon(Icons.person),
                describtion: "الملف الشخصي",
                onTap: () {
                  Get.toNamed(GetRoutes.sponsorprofile);
                },
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(Icons.people_outline),
                describtion: '  طلبات الكفالة المقبولة',
                onTap: () {
                  Get.toNamed(GetRoutes.getacceptedsponsororder,
                      arguments: user);
                },
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(Icons.people_outline),
                describtion: '  طلبات كفالة قيد المعالجة',
                onTap: () {
                  Get.toNamed(GetRoutes.getawaitingsponsororder,
                      arguments: user);
                },
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(Icons.settings),
                describtion: 'الاعدادات',
                onTap: () {
                  Get.back();
                },
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(Icons.wallet),
                describtion: 'المحفظة',
                onTap: () {
                  Get.back();
                },
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(Icons.timelapse),
                describtion: 'الوقت المتبقي',
                onTap: () {
                  Get.back();
                },
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                    items: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(93, 199, 204, 1),
                                Color.fromRGBO(27, 162, 169, 1),
                                Color.fromRGBO(113, 212, 218, 1),
                              ])),
                          padding: const EdgeInsets.only(top: 50),
                          child: Center(
                            child: const Text(
                                "لا أحد يصبح فقيراً من التبرع\nبل يصبح أغنى بالرضا والبركة   ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0)),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(93, 199, 204, 1),
                                Color.fromRGBO(27, 162, 169, 1),
                                Color.fromRGBO(113, 212, 218, 1),
                              ])),
                          padding: const EdgeInsets.only(top: 50),
                          child: Center(
                            child: const Text(
                                "إن التبرع ليس مجرد إعطاء مال \n بل هو إحداث فرق في حياة الأخرين",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0)),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(93, 199, 204, 1),
                                Color.fromRGBO(27, 162, 169, 1),
                                Color.fromRGBO(113, 212, 218, 1),
                              ])),
                          padding: const EdgeInsets.only(top: 50),
                          child: Center(
                            child: const Text(
                                "إن السعادة لا تنتج عما نحصل عليه \n بل بما نعطيه",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0)),
                          )),
                    ],
                    options: CarouselOptions(
                      disableCenter: true,
                      aspectRatio: 12 / 4,
                      viewportFraction: 0.6,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 7),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    )),
                const SizedBox(height: 20.0),
                const Text(
                  "غير عالمك بلمسة!",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black54),
                ),
                const SizedBox(height: 20.0),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(GetRoutes.donateidea,
                                    arguments: user);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: const Color.fromARGB(
                                        255, 241, 214, 246)),
                                child: const CustomIcon(
                                    image: "icons/hand.png",
                                    width: 80.0,
                                    height: 80.0),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("تبرع بفكرة"),
                          ]),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(GetRoutes.sponseranorphan,
                                      arguments: user);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: const Color.fromARGB(
                                          255, 196, 232, 235)),
                                  child: const CustomIcon(
                                      image: "icons/give-love.png",
                                      width: 80.0,
                                      height: 80.0),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("إكفل يتيم"),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(GetRoutes.myorphanes,
                                      arguments: user);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: const Color.fromARGB(
                                          255, 196, 229, 243)),
                                  child: const CustomIcon(
                                      image: "icons/adoption.png",
                                      width: 80.0,
                                      height: 80.0),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(" أيتامي"),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(GetRoutes.contactwithus,
                                      arguments: user);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: const Color.fromARGB(
                                          255, 250, 239, 229)),
                                  child: const CustomIcon(
                                      image: "icons/chat.png",
                                      width: 80.0,
                                      height: 80.0),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("  تواصل معنا"),
                            ],
                          ),
                        ])),
                const SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: [
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         const Text(
                    //           "  الإعلانات",
                    //           textAlign: TextAlign.right,
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 24,
                    //               color: Colors.black54),
                    //         ),
                    //         // TextButton(
                    //         //     onPressed: () {},
                    //         //     child: const Text(
                    //         //       "عرض الكل",
                    //         //       style: TextStyle(
                    //         //           fontSize: 17,
                    //         //           fontWeight: FontWeight.bold,
                    //         //           color: Colors.blue,
                    //         //           decoration: TextDecoration.underline),
                    //         //     ))
                    //       ],
                    //     ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(GetRoutes.adswithcourse);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/person-holding-light-bulb-with-graduation-cap.jpg"))),
                            child: const Center(
                              child: Text(
                                "دورات تعليمية",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(
                                GetRoutes.entertaimentadvertisementPage);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("images/sports-tools.jpg"))),
                            child: const Center(
                              child: Text(
                                "ترفيه",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(GetRoutes.trainingads);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/schoolchild-sitting-desk-living-room-holding-school-book.jpg"))),
                            child: const Center(
                              child: Text(
                                "تدريب",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(GetRoutes.remmemberAdvertisementPage);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/reminder-popup-bell-notification-alert-alarm-icon-sign-symbol-application-website-ui-purple-background-3d-rendering-illustration.jpg"))),
                            child: const Center(
                              child: Text(
                                "تذكيرات",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )

                    // Container(
                    //   width: MediaQuery.of(context).size.width - 30,
                    //   height: MediaQuery.of(context).size.height / 3,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(13),
                    //       image: const DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: AssetImage(
                    //               "images/reminder-popup-bell-notification-alert-alarm-icon-sign-symbol-application-website-ui-purple-background-3d-rendering-illustration.jpg"))),
                    //   child: const Center(
                    //     child: Text(
                    //       "تذكيرات",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           backgroundColor: Colors.black38,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width - 30,
                    //   height: MediaQuery.of(context).size.height / 3,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(13),
                    //       image: const DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: AssetImage(
                    //               "images/classmates-working-together.jpg"))),
                    //   child: const Center(
                    //     child: Text(
                    //       "تدريب",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           backgroundColor: Colors.black38,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20),
                    //     ),
                    //   ),
                    // )

                    // CarouselSlider(
                    //     items: [
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(13),
                    //             image: const DecorationImage(
                    //                 fit: BoxFit.cover,
                    //                 image: AssetImage(
                    //                     "images/schoolchild-sitting-desk-living-room-holding-school-book.jpg"))),
                    //         child: const Center(
                    //           child: Text(
                    //             "دورة صناعة الصابون",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 backgroundColor: Colors.black45,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 20),
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(13),
                    //             image: const DecorationImage(
                    //                 fit: BoxFit.cover,
                    //                 image: AssetImage(
                    //                     "images/classmates-working-together.jpg"))),
                    //         child: const Center(
                    //           child: Text(
                    //             "دورة الحاسوب ",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 backgroundColor: Colors.black45,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 20),
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(13),
                    //             image: const DecorationImage(
                    //                 fit: BoxFit.cover,
                    //                 image: AssetImage(
                    //                     "images/children-group-drawing.jpg"))),
                    //         child: const Center(
                    //           child: Text(
                    //             "دورة صناعة الشمع ",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 backgroundColor: Colors.black45,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 20),
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(13),
                    //             image: const DecorationImage(
                    //                 fit: BoxFit.cover,
                    //                 image: AssetImage(
                    //                     "images/little-kids-using-laptops-school.jpg"))),
                    //         child: const Center(
                    //           child: Text(
                    //             "دورة الللغة العربية ",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 backgroundColor: Colors.black45,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 20),
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(13),
                    //             image: const DecorationImage(
                    //                 fit: BoxFit.cover,
                    //                 image: AssetImage(
                    //                     "images/close-up-classmates-playing-with-laptop.jpg"))),
                    //         child: const Center(
                    //           child: Text(
                    //             "دورة الرياضيات ",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 backgroundColor: Colors.black45,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 20),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //     options: CarouselOptions(
                    //       disableCenter: true,
                    //       aspectRatio: 1.5,
                    //       viewportFraction: 0.8,
                    //       initialPage: 0,
                    //       enableInfiniteScroll: true,
                    //       reverse: false,
                    //       autoPlay: true,
                    //       autoPlayInterval: const Duration(seconds: 5),
                    //       autoPlayAnimationDuration:
                    //           const Duration(milliseconds: 2000),
                    //       autoPlayCurve: Curves.fastOutSlowIn,
                    //       enlargeCenterPage: true,
                    //       enlargeFactor: 0.3,
                    //       scrollDirection: Axis.horizontal,
                    //     )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
