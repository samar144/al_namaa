import 'package:alnamaa_charity/core/widget/text_form_field.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:alnamaa_charity/utils/baseurl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sponser_home_controller.dart';

class MyOrphanes extends StatelessWidget {
  //MyOrphanes({super.key});
  final HomeController controller = Get.put(HomeController());
  // UserModel user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            actions: const [
              CircleAvatar(
                child: Text("H"),
              ),
            ],
            backgroundColor: Colors.white,
            elevation: 2,
            title: Text(
              "أيتامي",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.cyan[600]),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.toNamed(GetRoutes.sponserhomepage);
                },
                icon: Icon(
                  Icons.backspace_outlined,
                  color: Colors.cyan[600],
                ))),
        body: FutureBuilder<void>(
            future: controller.getorphansponsor(),
            builder: (context, snapshot) {
              return Obx(() {
                final data = controller.orphanforsponser;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      final item = data[index];
                      var token =
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWM5NDQ0MTE1Yjc2MDJjNTNlNWJkZDU1YTRmZjkzY2UyYTIwMDBlYjRjYTk5NDJmYmRkNTFhZjA5ZTdlNjJlMDQ4YTQ3ZmNkYWU4ZTk2MzYiLCJpYXQiOjE2OTIwODI5MjguOTczNTcxLCJuYmYiOjE2OTIwODI5MjguOTczNTc1LCJleHAiOjE3MjM3MDUzMjguOTE3OTUzLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.KJGP4Vm_qM_VHrn9E9A8MuGpwD4UchkLFWTjsqh4yqhJzCRNOxlZ_-DAStWjZnPw4BbalieN0ebAm4U2pt23LeVFnyp9lMIFYpEu7VQkj5H3rgadUwuYxlcUXHKdp5KbvVyD8MzJgfrg2J21SGTc3HAjbr-LrdvGFeWD6R48Mufcm2k37WjGL8n-oFw6eEnS7gbJBnYKaYjpso4JwyGgh3_DiEbFtFIm-k1M2vzom1oEkqxbQtMYp0VDIazvAWZmfghMfvIWyQ5GJ6cesK3BQ_w1pfSyB5trCaMIjDVRJSP4nWPEvVz-5ZyoVmmGu7IvjlTCxkN8uXVQPKMkySPREZL-yGJbxq89aNFoK_J-Mqzb1cCFsq1F0vKitke124EEuo-Wb906weGEcoeMvn1NPAqebrxFXyOe4pKTzHpZJqVJDmRCpHIZZ4jhPmLBx0HRxG-Oxllqxn-GT0Uvjrnory6x6rM0hokJzGm6jR8LAz-qT33AJU0WKAVtAirPbzBJrmDfN-Z5U-dbAjMG0xbEEjhuo4UdE9pLTIeX6_jrKePSAG0n33oiD0xeIiPrykemx4GT7qfCCk5w-bVHqgwLymXoevw_nV3yqLLaLaZ14QjkrOZ_Ca3ZiHMPcKcznq9Vg9hawIcBEQLhbUcNLs1fthuMhhFeos0RcOZHe7s5DSc";
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.cyan[600],
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(12),
                                  right: Radius.circular(12))),
                          height: 150,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(GetRoutes.profile);
                                  },
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "$baseUrl+${item["orphan"]["photo"].toString()}",
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            httpHeaders: {
                                              "Content-Type":
                                                  "application/json",
                                              "Accept": "application/json",
                                              "Authorization": "Bearer $token"
                                            },
                                            fit: BoxFit.fill,
                                            width: 99,
                                            height: 99,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Text(item["orphan"]["first_name"]
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 200),
                              Expanded(
                                flex: 3,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) => Dialog(
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              100,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                                "إلغاء الكفالة"),
                                                            const Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Icon(Icons
                                                                    .warning_outlined),
                                                                Text(
                                                                    "الرجاء ذكر السبب "),
                                                              ],
                                                            ),
                                                            TextFormFieldWidget(
                                                              label: "",
                                                              controller: controller
                                                                  .notecontroller,
                                                              maxlines: 5,
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .cyan),
                                                                    onPressed:
                                                                        () {
                                                                      Get.back();
                                                                    },
                                                                    child: const Text(
                                                                        "رجوع")),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    controller
                                                                        .stopsponsorshiporder(
                                                                      item[
                                                                          "sponsorship_id"],
                                                                    );
                                                                  },
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red),
                                                                  child: const Text(
                                                                      "تأكيد"),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ));
                                        },
                                        icon: const Icon(Icons.delete),
                                        tooltip: "حذف",
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit),
                                        tooltip: "تعديل",
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }));
              });
            }),
      ),
    );
  }
}
