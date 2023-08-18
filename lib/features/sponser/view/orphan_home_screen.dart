import 'package:alnamaa_charity/core/widget/customicon.dart';
import 'package:alnamaa_charity/features/auth/signup/model/user_register_model.dart';
import 'package:alnamaa_charity/utils/colors';
import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/widget/custom_list_tile.dart';
import '../../../core/widget/drawer.dart';
import '../../../routes.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../controller/sponser_home_controller.dart';

class OrphanHomePage extends StatefulWidget {
  @override
  _OrphanHomePageState createState() => _OrphanHomePageState();
}

class _OrphanHomePageState extends State<OrphanHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();
  final HomeController controller = Get.put(HomeController());
  // UserModel user = GetStorageUtils().getUser();

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
            icon: CircleAvatar(
                child: Text(controller.user.name!.substring(0, 1))),
          ),
        ),
        drawer: MyDrawer(
            name: controller.user.name!,
            image: "images/1.png",
            email: controller.user!.email!,
            listTile: [
              CustomListTile(
                icon: const Icon(Icons.person),
                describtion: "الملف الشخصي",
                onTap: () {
                  Get.toNamed(GetRoutes.dashboared);
                },
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(Icons.people_outline),
                describtion: '  طلبات الكفالة المقبولة',
                onTap: () {
                  Get.toNamed(GetRoutes.getacceptedsponsororder,
                      arguments: controller.user);
                },
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(Icons.people_outline),
                describtion: '  طلبات كفالة قيد المعالجة',
                onTap: () {
                  Get.toNamed(GetRoutes.getawaitingsponsororder,
                      arguments: controller.user);
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
                          padding: const EdgeInsets.all(19),
                          child: const Text(
                              "مرحبًا بك في تطبيق جمعية النماء! انضم إلينا لتحقيق التطور والنماء الشخصي من خلال دوراتنا التعليمية الممتعة والمفيدة.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.0,
                              ))),
                      Directionality(
                        textDirection:
                            TextDirection.rtl, // or TextDirection.ltr
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(93, 199, 204, 1),
                              Color.fromRGBO(27, 162, 169, 1),
                              Color.fromRGBO(113, 212, 218, 1),
                            ]),
                          ),
                          padding: const EdgeInsets.all(19),
                          child: Text(
                            "نحن سعداء بوجودك في تطبيق جمعية النماء!\n اكتشف فرص التعلم والتطور المستمر معنا واستفد من محتوى \nذو جودة عالية يساعدك على بناء مستقبل مشرق.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(93, 199, 204, 1),
                                Color.fromRGBO(27, 162, 169, 1),
                                Color.fromRGBO(113, 212, 218, 1),
                              ])),
                          padding: const EdgeInsets.all(19),
                          child: const Text(
                              "أهلاً بك في تطبيق جمعية النماء! انضم إلينا لتحصل على فرصة لاستكشاف العلم وتطوير مهاراتك وتحقيق أهدافك الشخصية والمهنية.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.0,
                              ))),
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
                Text(
                  "غير عالمك بلمسة!",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColors.mainColor),
                ),
                const SizedBox(height: 20.0),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(GetRoutes.donateidea);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: const Color.fromARGB(
                                        255, 241, 214, 246)),
                                child: const CustomIcon(
                                    image: "assets/icons/hand.png",
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
                                  Get.toNamed(
                                    GetRoutes.courses,
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: const Color.fromARGB(
                                          255, 196, 229, 243)),
                                  child: const CustomIcon(
                                      image:
                                          "assets/icons/education-app_4996403.png",
                                      width: 80.0,
                                      height: 80.0),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(" دوراتي"),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(GetRoutes.contactwithus);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: const Color.fromARGB(
                                          255, 250, 239, 229)),
                                  child: const CustomIcon(
                                      image: "assets/icons/chat.png",
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
                  height: 20.0,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "  الإعلانات",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black54),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) => Dialog(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text("التسجيل على دورة"),
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(Icons
                                                        .select_all_rounded),
                                                    Text("الرجاء اختيار حساب "),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 66,
                                                  child: ListView.builder(
                                                    itemCount: 3,
                                                    //controller.activeCourses?.length ?? 0,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      // var active = controller.activeCourses?[index];
                                                      bool isSelected = false;
                                                      return Container(
                                                        width: 200,
                                                        height: 50,
                                                        margin: EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 10,
                                                            top: 10),
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Color(
                                                                      0XFFe8e8e8),
                                                                  blurRadius:
                                                                      5.0,
                                                                  offset:
                                                                      Offset(0,
                                                                          5)),
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(-5,
                                                                          0)),
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(5,
                                                                          0)),
                                                            ]),
                                                        child: Expanded(
                                                          child: Container(
                                                            height: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20)),
                                                              // color: Colors.white,
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                              child:
                                                                  Directionality(
                                                                textDirection:
                                                                    TextDirection
                                                                        .rtl,
                                                                child:
                                                                    CheckboxListTile(
                                                                  title: Text(
                                                                    "samar account",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    //' الفئة العمرية ${active?.targetGroup ?? ''}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black45),
                                                                  ),
                                                                  value:
                                                                      isSelected,
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      isSelected =
                                                                          value ??
                                                                              false;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .cyan),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child:
                                                            const Text("رجوع")),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        // controller
                                                        //     .stopsponsorshiporder(
                                                        //   item[
                                                        //       "sponsorship_id"],
                                                        // );
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.red),
                                                      child:
                                                          const Text("تأكيد"),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                            },
                            child: const Text(
                              "عرض الكل",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CarouselSlider(
                        items: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/schoolchild-sitting-desk-living-room-holding-school-book.jpg"))),
                            child: const Center(
                              child: Text(
                                "دورة صناعة الصابون",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/classmates-working-together.jpg"))),
                            child: const Center(
                              child: Text(
                                "دورة الحاسوب ",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/children-group-drawing.jpg"))),
                            child: const Center(
                              child: Text(
                                "دورة صناعة الشمع ",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/little-kids-using-laptops-school.jpg"))),
                            child: const Center(
                              child: Text(
                                "دورة الللغة العربية ",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/close-up-classmates-playing-with-laptop.jpg"))),
                            child: const Center(
                              child: Text(
                                "دورة الرياضيات ",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          disableCenter: true,
                          aspectRatio: 1.5,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        )),
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
