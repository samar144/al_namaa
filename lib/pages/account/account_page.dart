import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_controller.dart';

class AccountPage extends GetView<AccountController> {
  AccountPage({key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  final AccountController controller = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        child: const Center(
          child: Text("account Page"),
        ),
      ),
      appBar: AppBar(
        title: Text(controller.title),
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const CircleAvatar(child: Text("")),
        ),
      ),
      // drawer: MyDrawer(listTile: []),
    );
  }
}
