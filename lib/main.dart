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
  // await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: GetRoutes.home,
      // initialBinding: BindingsBuilder(() {
      //   Get.put(BottomNavigationController());
      // }),
      getPages: GetRoutes.route,
      // initialBinding: Binding(),
      title: 'Al_Namaa Charity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1ea1a7)),
        appBarTheme: AppBarTheme(backgroundColor: Colors.cyan[600]),
        useMaterial3: true,
      ),
      home: UserSignInrScreen(),
      // home: FutureBuilder<bool>(
      //   future: shouldShowIntroduction(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Scaffold(
      //         body: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Scaffold(
      //         body: Center(
      //           child: Text('Error loading data'),
      //         ),
      //       );
      //     } else {
      //       final bool showIntroduction = snapshot.data!;
      //       return showIntroduction ? const IntroScreen() : MyOrphanes();
      //     }
      //   },
      // ),
    );
  }

  // Future<bool> shouldShowIntroduction() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool showedIntroduction = prefs.getBool('showedIntroduction') ?? false;
  //   return !showedIntroduction;
  // }
}





//old 
//
//import 'package:alnamaa_charity/features/Profile/main_profile.dart';
// import 'package:alnamaa_charity/features/Profile/profile_controller.dart';
// import 'package:alnamaa_charity/routes.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'binding/binding.dart';
// import 'core/page/introduction_screen.dart';
// import 'features/auth/signin/view/user_sign_in_screen.dart';
// import 'features/auth/signup/view/sponser_register_screen.dart';
// import 'features/auth/signup/view/user_register_screen.dart';
// import 'features/donate_an_idea/view/donate_an_idea.dart';
// import 'features/sponser/view/sponser_home_screen.dart';
// import 'features/sponser/view/sponsor_an_orphan.dart';
// import 'binding/binding.dart' as dep;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized;
//   await dep.init();

//   // WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({key});

//   @override
//   Widget build(BuildContext context) {
//     Get.find<ProfileController>().getProfileList();

//     return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         // initialRoute: GetRoutes.home,
//         // initialBinding: BindingsBuilder(() {
//         //   Get.put(BottomNavigationController());
//         // }),
//         getPages: GetRoutes.route,
//         // initialBinding: Binding(),
//         title: 'Al_Namaa Charity',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1ea1a7)),
//           appBarTheme: AppBarTheme(backgroundColor: Colors.cyan[600]),
//           useMaterial3: true,
//         ),
//         home: MainProfile()
//         //  FutureBuilder<bool>(
//         //   future: shouldShowIntroduction(),
//         //   builder: (context, snapshot) {
//         //     if (snapshot.connectionState == ConnectionState.waiting) {
//         //       return Scaffold(
//         //         body: Center(
//         //           child: CircularProgressIndicator(),
//         //         ),
//         //       );
//         //     } else if (snapshot.hasError) {
//         //       return Scaffold(
//         //         body: Center(
//         //           child: Text('Error loading data'),
//         //         ),
//         //       );
//         //     } else {
//         //       final bool showIntroduction = snapshot.data!;
//         //       return showIntroduction ? const IntroScreen() : MainProfile();
//         //     }
//         //   },
//         // ),
//         );
//   }

//   // Future<bool> shouldShowIntroduction() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   bool showedIntroduction = prefs.getBool('showedIntroduction') ?? false;
//   //   return !showedIntroduction;
//   // }
// }
