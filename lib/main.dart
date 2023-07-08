import 'package:alnamaa_charity/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/auth/signup/view/sponser_register_screen.dart';
import 'features/auth/signup/view/user_register_screen.dart';
import 'features/donate_an_idea/view/donate_an_idea.dart';
import 'features/sponser/view/sponser_home_screen.dart';
import 'features/sponser/view/sponsor_an_orphan.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: GetRoutes.home,
      // initialBinding: BindingsBuilder(() {
      //   Get.put(BottomNavigationController());
      // }),
      getPages: GetRoutes.route,
      // initialBinding: DashBoaredBinding(),
      title: 'Al_Namaa Charity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1ea1a7)),
        appBarTheme: AppBarTheme(backgroundColor: Colors.cyan[600]),
        useMaterial3: true,
      ),
      home: SponserRegisterScreen(),
    );
  }
}
