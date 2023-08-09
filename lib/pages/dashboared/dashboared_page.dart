import 'package:alnamaa_charity/pages/account/account_page.dart';
import 'package:alnamaa_charity/pages/alert/alert_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';
import '../news_page/news_page.dart';
import 'dashboared_controller.dart';

class DashboaredHomePage extends StatelessWidget {
  DashboaredHomePage({key});
  final void dashcontroller =
      Get.lazyPut<DashBoaredController>(() => DashBoaredController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<DashBoaredController>(builder: (controller) {
        return Scaffold(
          body: SafeArea(
              child: IndexedStack(
            index: controller.tabIndex,
            children: [HomePage(), NewsPage(), AlertPage(), AccountPage()],
          )),
          bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.blue,
              onTap: (index) => controller.changtabindex(index),
              currentIndex: controller.tabIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                _bottomNavigationBarItem(
                    icon: CupertinoIcons.home, label: "Home"),
                _bottomNavigationBarItem(
                    icon: CupertinoIcons.sportscourt_fill, label: "News"),
                _bottomNavigationBarItem(
                    icon: CupertinoIcons.bell, label: "Alert"),
                _bottomNavigationBarItem(
                    icon: CupertinoIcons.person, label: "Account"),
              ]),
        );
      }),
    );
  }
}

_bottomNavigationBarItem({required IconData icon, required String label}) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
