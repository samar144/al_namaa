import 'package:alnamaa_charity/core/widget/text_form_field.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:alnamaa_charity/utils/baseurl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../../Profile/profile_controller.dart';
import '../../auth/signup/model/user_register_model.dart';
import '../controller/sponser_home_controller.dart';
import 'orphanprofileforsponser.dart';

class MyOrphanes extends StatelessWidget {
  MyOrphanes({super.key});
  final HomeController controller = Get.put(HomeController());

  // final ProfileController controller1 = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 80,
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
                    Navigator.pop(context);
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(5),
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
                                        // GetStorageUtils().saveorphanid(
                                        //     item["orphan"]["id"].toString());
                                        Get.toNamed(
                                          GetRoutes.orphanprofileforsponser,
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipOval(
                                            //     child: Image.network(
                                            //   "$baseUrl${item["orphan"]["photo"]}",
                                            //   fit: BoxFit.fill,
                                            //   height: 111,
                                            //   width: 111,
                                            // )
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  "$baseUrl${item["orphan"]["photo"]}",
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                              fit: BoxFit.fill,
                                              height: 111,
                                              width: 111,
                                            ),
                                          ),
                                          // const CircleAvatar(
                                          //     // child: Text(user.name!.substring(0, 1))
                                          //     child: Text("")),
                                          // CircleAvatar(

                                          //   backgroundImage: AssetImage(baseUrl +
                                          //       controller.orphanforsponser[i]["photo"]),
                                          //   radius: 50,
                                          // ),
                                          // Image.network(baseUrl +
                                          //     controller.orphanforsponser[i]["photo"]),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(item["orphan"]["first_name"]
                                                  .toString() +
                                              " " +
                                              item["orphan"]["last_name"]
                                                  .toString())
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) => Dialog(
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            100,
                                                        height: MediaQuery.of(
                                                                    context)
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
                                                                controller:
                                                                    controller
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
                                                                          backgroundColor: Colors
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
                                                                            Colors.red),
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
                                    ))
                              ],
                            ),
                          ),
                        );
                      }));
                });
              })),
    );
  }
}
