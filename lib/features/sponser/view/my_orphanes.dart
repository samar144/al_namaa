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
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTVhMjg1MTJiMzgyMjcyZTIyOWY3MTAyMTY0ZmMxMzYyNTA0ZjVjYWIwYWIxNzdjMzUyNmE4OGY1OTMzNGNiM2VkZjY1NDE0Y2Q0MzIwMjQiLCJpYXQiOjE2OTIyODE2NTIuNjY4Nzk2LCJuYmYiOjE2OTIyODE2NTIuNjY4ODAxLCJleHAiOjE3MjM5MDQwNDkuODE0NzA0LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.G7ks9kxwR4tPO-KMfGNfrZL6CNLQjBD-9V_mE6XNPmtxzStNEYESs-S55l-1ToLKdHA3H7kO79ARJ-iAfsE05fPB6uS6TnWz4ECfzGq8PC_Zhiwfsp-PWtfxyJIfROsS3Dvfmc7NizbvFilvGn91tO6p3pc2K1UIdInieyYt-1w32ZKFBoIiLg3hgsYJlJWxPbLALLxhzzW0U0F0U0tLIOq25GOQ70jR1AWSU53n4tfqr-P4xx3dShtYUSYqXb_DX8SLzre9IqR3LC5EduvmaS2eiCdn5AwF9Z5nKQ7izvAyK_ywrCEePxTxgsPFHzNwOtGJlIDzbssITGN1AvqBX1BDZ2S-ZD2KKG5mi02sY1Is_LbqGbNXj678RbE1EGSx4hyVrXlmxfeFnPQJ2Cscc94JNDM4igO_xStDTodulb93CHEho4MWBFEMlXvZJqLzxmV071wRxPrxxWb1z8UaM4fVeko5G0xgs2_-_gvKI5gZ3Tv_MDZ3RbG-Aibhf-NLQmDSTIihRdoiz_X1HpIVDZ-tV8aXNgfv9cG5MAFd7i5Iz7sC-JJZBz-ueV6CXQ1aa997JYhBh77O5r1EM2Kkf5JbmjEeQaIfgFOlAutEPq_dLEoB8dQkxobarctrtEzrJQFu80X3_E0BxujHHkJUcNzbTj2nyhQyY7v8mZb9iOI";
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
