import 'package:alnamaa_charity/features/auth/signup/model/user_register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sponser_home_controller.dart';

class GetSponsorOrders extends StatelessWidget {
  GetSponsorOrders({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            actions: [
              CircleAvatar(
                child: Text(controller.user.name!.substring(0, 1)),
              ),
            ],
            backgroundColor: Colors.white,
            elevation: 2,
            title: Text(
              "طلبات الكفالة",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.cyan[600]),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back(canPop: true);
                },
                icon: Icon(
                  Icons.backspace_outlined,
                  color: Colors.cyan[600],
                ))),
        body: GetBuilder<HomeController>(builder: (con) {
          return ListView(
            shrinkWrap: true,
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.amberAccent),
                child: const Text("الطلبات المقبولة"),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.acceptancesponserorders.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.green),
                        child: Column(
                          children: [
                            Text(
                              con.acceptancesponserorders[i]["payment_way"]
                                  .toString(),
                            ),
                            Text(
                              con.acceptancesponserorders[i]["sponsor_id"]
                                  .toString(),
                            ),
                            Text(
                              con.acceptancesponserorders[i]["alternative_name"]
                                  .toString(),
                            ),
                            Text(
                              con.acceptancesponserorders[i]["end_date"]
                                  .toString(),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              // Container(
              //   decoration: BoxDecoration(color: Colors.amberAccent),
              //   child: Text("طلبات قيد الانتظار "),
              // ),
              // ListView.separated(
              //     shrinkWrap: true,
              //     itemCount: controller.acceptancesponserorders.length,
              //     separatorBuilder: (context, index) => const SizedBox(
              //           height: 10,
              //         ),
              //     itemBuilder: (context, i) {
              //       return Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: Container(
              //           decoration: BoxDecoration(color: Colors.orange),
              //           child: Column(
              //             children: [
              //               Text(
              //                 con.waitingsponserorders[i]["payment_way"]
              //                     .toString(),
              //               ),
              //               Text(
              //                 con.waitingsponserorders[i]["sponsor_id"]
              //                     .toString(),
              //               ),
              //               Text(
              //                 con.waitingsponserorders[i]["alternative_name"]
              //                     .toString(),
              //               ),
              //               Text(
              //                 con.waitingsponserorders[i]["end_date"]
              //                     .toString(),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     }),
            ],
          );
        }),
      ),
    );
  }
}
