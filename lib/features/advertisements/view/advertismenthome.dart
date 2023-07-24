import 'package:alnamaa_charity/core/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/adscontroller.dart';

class AdsHome extends StatelessWidget {
  AdsHome({super.key});
  final AdsController controller = Get.put(AdsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("الأعلانات", []),
      body: GetBuilder<AdsController>(builder: (contrpller) {
        return SingleChildScrollView(
          child: ListView.separated(
              itemBuilder: ((context, i) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(controller.ads[i].image))),
                  child: Center(
                    child: Text(
                      controller.ads[i].title,
                      style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                );
              }),
              separatorBuilder: (context, i) {
                return Divider();
              },
              itemCount: controller.ads.length),
        );
      }),
    );
  }
}
