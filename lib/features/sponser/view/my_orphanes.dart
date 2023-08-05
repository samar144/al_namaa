import 'package:alnamaa_charity/core/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/signup/model/user_register_model.dart';
import '../controller/sponser_home_controller.dart';

class MyOrphanes extends StatelessWidget {
  MyOrphanes({super.key});
  final HomeController controller = Get.put(HomeController());
  UserModel user = Get.arguments;

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
                    Get.back();
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
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const CircleAvatar(
                                              // child: Text(user.name!.substring(0, 1))
                                              child: Text("")),
                                          // CircleAvatar(

                                          //   backgroundImage: AssetImage(baseUrl +
                                          //       controller.orphanforsponser[i]["photo"]),
                                          //   radius: 50,
                                          // ),
                                          // Image.network(baseUrl +
                                          //     controller.orphanforsponser[i]["photo"]),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(item["orphan"]["first_name"]
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
                                                                              item["sponsorship_id"]);
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
              })

          // GetBuilder<HomeController>(builder: (context) {
          //   return ListView.separated(
          //       separatorBuilder: (context, index) {
          //         return const Divider();
          //       },
          //       itemCount: controller.orphanforsponser
          //           .length, // number of ListTiles you want to display
          //       itemBuilder: (context, int i) {
          //         return Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Container(
          //             height: 150,
          //             child: Row(
          //               children: [
          //                 Expanded(
          //                     flex: 3,
          //                     child: InkWell(
          //                       onTap: () {},
          //                       child: Row(
          //                         mainAxisAlignment: MainAxisAlignment.start,
          //                         children: [
          //                           CircleAvatar(
          //                               // child: Text(user.name!.substring(0, 1))
          //                               child: Text("")),
          //                           // CircleAvatar(

          //                           //   backgroundImage: AssetImage(baseUrl +
          //                           //       controller.orphanforsponser[i]["photo"]),
          //                           //   radius: 50,
          //                           // ),
          //                           // Image.network(baseUrl +
          //                           //     controller.orphanforsponser[i]["photo"]),
          //                           const SizedBox(
          //                             width: 20,
          //                           ),
          //                           Text(controller.orphanforsponser[i]
          //                                   ["first_name"]
          //                               .toString())
          //                         ],
          //                       ),
          //                     )),
          //                 Expanded(
          //                     flex: 1,
          //                     child: Row(
          //                       children: [
          //                         IconButton(
          //                           onPressed: () {
          //                             showDialog(
          //                                 useSafeArea: true,
          //                                 context: context,
          //                                 builder: (context) => Dialog(
          //                                       child: Container(
          //                                         width: MediaQuery.of(context)
          //                                                 .size
          //                                                 .width -
          //                                             100,
          //                                         height: MediaQuery.of(context)
          //                                                 .size
          //                                                 .height /
          //                                             3,
          //                                         child: Padding(
          //                                           padding:
          //                                               const EdgeInsets.all(8.0),
          //                                           child: Column(
          //                                             mainAxisAlignment:
          //                                                 MainAxisAlignment
          //                                                     .center,
          //                                             children: [
          //                                               const Text(
          //                                                   "إلغاء الكفالة"),
          //                                               const Row(
          //                                                 mainAxisAlignment:
          //                                                     MainAxisAlignment
          //                                                         .spaceBetween,
          //                                                 children: [
          //                                                   Icon(Icons
          //                                                       .warning_outlined),
          //                                                   Text(
          //                                                       "الرجاء ذكر السبب "),
          //                                                 ],
          //                                               ),
          //                                               const TextFormFieldWidget(
          //                                                 label: "",
          //                                                 maxlines: 5,
          //                                               ),
          //                                               const SizedBox(
          //                                                 height: 20,
          //                                               ),
          //                                               Row(
          //                                                 children: [
          //                                                   ElevatedButton(
          //                                                       style: ElevatedButton
          //                                                           .styleFrom(
          //                                                               backgroundColor:
          //                                                                   Colors
          //                                                                       .cyan),
          //                                                       onPressed: () {
          //                                                         Get.back();
          //                                                       },
          //                                                       child: const Text(
          //                                                           "رجوع")),
          //                                                   const SizedBox(
          //                                                     width: 10,
          //                                                   ),
          //                                                   ElevatedButton(
          //                                                     onPressed: () {},
          //                                                     style: ElevatedButton
          //                                                         .styleFrom(
          //                                                             backgroundColor:
          //                                                                 Colors
          //                                                                     .red),
          //                                                     child: const Text(
          //                                                         "تأكيد"),
          //                                                   ),
          //                                                 ],
          //                                               )
          //                                             ],
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     ));
          //                           },
          //                           icon: const Icon(Icons.delete),
          //                           tooltip: "حذف",
          //                         ),
          //                         IconButton(
          //                           onPressed: () {},
          //                           icon: const Icon(Icons.edit),
          //                           tooltip: "تعديل",
          //                         )
          //                       ],
          //                     ))
          //               ],
          //             ),
          //           ),
          //         );
          //       });
          // }),
          ),
    );
  }
}
