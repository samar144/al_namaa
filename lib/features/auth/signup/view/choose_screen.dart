import 'package:alnamaa_charity/core/widget/button.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: SafeArea(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  name: "إنشاء حساب مستخدم",
                  onPressed: () {
                    Get.toNamed(GetRoutes.signup);
                  },
                ),
                CustomButton(
                  name: "إنشاء حساب كفيل",
                  onPressed: () {
                    Get.toNamed(GetRoutes.sponsersignup);
                  },
                ),
              ],
            ),
          ),
        )));
  }
}
