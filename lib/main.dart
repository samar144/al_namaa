import 'package:alnamaa_charity/features/auth/signup/model/user_register_model.dart';
import 'package:alnamaa_charity/routes.dart';

import 'features/Profile/main_profile.dart';
import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'binding/binding.dart';
import 'core/page/introduction_screen.dart';
import 'features/advertisements/view/advertismenthome.dart';
import 'features/auth/signin/view/user_sign_in_screen.dart';
import 'features/auth/signup/view/sponser_register_screen.dart';
import 'features/auth/signup/view/user_register_screen.dart';
import 'features/comments_reply/view/commentpage.dart';
import 'features/comments_reply/view/comment.dart';
import 'features/donate_an_idea/view/donate_an_idea.dart';
import 'features/sponser/view/my_orphanes.dart';
import 'features/sponser/view/sponser_home_screen.dart';
import 'package:get_storage/get_storage.dart';

import 'features/sponser/view/sponsor_an_orphan.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      getPages: GetRoutes.route,
      // initialBinding: Binding(),
      title: 'Al_Namaa Charity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1ea1a7)),
        appBarTheme: AppBarTheme(backgroundColor: Colors.cyan[600]),
        useMaterial3: true,
      ),
      home: MyOrphanes(),
    );
  }
}
