import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes.dart';

class MyDrawer extends StatelessWidget {
  // final box = GetStorage();
  final List<Widget> listTile;
  final String name;
  final String email;
  final String image;
  const MyDrawer(
      {key,
      required this.listTile,
      required this.name,
      required this.email,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, colors: [
          Color.fromRGBO(93, 199, 204, 1),
          Color.fromRGBO(27, 162, 169, 1),
          Color.fromRGBO(113, 212, 218, 1),
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
              accountName: Text(name),
              accountEmail: Text(email),
            ),
            Column(
              children: listTile,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('تسجيل الخروج'),
              onTap: () {
                // ShredPref.removeuser();
                Get.offAllNamed(GetRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
