import 'package:alnamaa_charity/features/auth/signup/model/user_register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sponser_home_controller.dart';

class GetAcceptedSponsorOrders extends StatelessWidget {
  GetAcceptedSponsorOrders({super.key});
  final HomeController controller = Get.put(HomeController());
  // UserModel user = Get.arguments;

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
                "طلبات الكفالة المقبولة",
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
          body: FutureBuilder<void>(
              future: controller.acceptedsponserorders(),
              builder: (context, snapshot) {
                return Obx(() {
                  final data = controller.acceptedorder;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        final item = data[index];
                        return Container(
                          margin: const EdgeInsets.all(6),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.cyan[600],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["alternative_name"].toString()),
                              Text(item["orphan_id"].toString()),
                              Text(item["amount"].toString()),
                              Text(item["start_date"].toString()),
                              Text(item["end_date"].toString()),
                              Text(item["alternative_phone"].toString()),
                              Text(item["note"].toString()),
                            ],
                          ),
                        );
                      }));
                });
              })
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

          ),
    );
  }
}
