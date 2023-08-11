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
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWJhYTlhMDJhNDMxNzJmNDI2NTA3ZTg4YTkyYTAzZTg3ZjI0MzMxNzFhNDg0ZmYwNjliNTcxZTNhN2FlZWRiNmU5NDY3OWMwN2RjMjE4NmEiLCJpYXQiOjE2OTE3MjYzNDUuOTI1NzA3LCJuYmYiOjE2OTE3MjYzNDUuOTI1NzEyLCJleHAiOjE3MjMzNDg3NDUuODU3MDYyLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.FVttJM9JB91fAg4gpshQKDGVgw7Ipe-H7J3uBSIaE9o5Gt4gw3mVcrRpX-eckIIqZ4w0-nXkOmoRxuv8_cpDux2DW3qszL_unN7j6sMKCGujbxx43FQxYEJpQxTv3Q79vZ6D-G_ic4FC7AIaZt2hIKulqxEnP1B_3BC9b9Q4tUaQwgnJzKaJ_5X9qwOi_b7OzcoTitmXjrHGr9UAK2chuVLdAswo2vb62vBV9KW5jOkO3G3TuMq7NPefed-LYqtHSi2q5-hW52TvMObpl5X3Mu22V5haBfui_InFbU-eA8dUgrjpeu7udKhCwo-GLvr2DwiAvFZNOohrTe904BprunfVWL7Sl6PQXI-flSZHhAHT4Md_R2dedgzwZWCjOtJqRCewt5eOS-2u7LqRqf1pWJce1pKe_9brRQBQQ9CWlPhdt6DUfbTXBeje7jvm3AAjIB9FASNXlvs00DUM6pbmdXEIgvuAtim2bbZLve-WXhVqnBesiEGPv17zuFcL6JkJfQXc-lyzGbSpU5yz8KBNb4XwcMxL4uWKYmQn58E6ekoITbq_-_t0xmC8ZdI7OdVq12uCgFIT3wQ--Y5o10tImGemidtLGj4NwQrSouUo2jQlKcowIofshaNwUakM0r6n5ePi7zkR38fHCom9A538AvzPY_BDcxoKte9My_tg2Ic";
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
