import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/signup/model/user_register_model.dart';
import '../controller/sponser_home_controller.dart';

class GetWaitingSponsorOrders extends StatelessWidget {
  //GetWaitingSponsorOrders({super.key});
  final HomeController controller = Get.put(HomeController());
  UserModel user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 80,
              actions: [
                CircleAvatar(
                  child: Text(user.name!.substring(0, 1)),
                ),
              ],
              backgroundColor: Colors.white,
              elevation: 2,
              title: Text(
                "طلبات قيد المعالجة ",
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
              future: controller.waitingsponserorders(),
              builder: (context, snapshot) {
                return Obx(() {
                  final data = controller.waitingorder;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        final item = data[index];
                        return Container(
                          margin: const EdgeInsets.all(6),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 250, 227, 170),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["alternative_name"].toString()),
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
              })),
    );
  }
}
