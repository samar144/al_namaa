import 'package:alnamaa_charity/features/contact_with_us/view/contact_with_us_screen.dart';
import 'package:alnamaa_charity/pages/dashboared/dashboared_binding.dart';
import 'package:alnamaa_charity/pages/dashboared/dashboared_page.dart';
import 'package:get/get.dart';

import 'core/page/introduction_screen.dart';
import 'features/auth/signin/view/resetpassword.dart';
import 'features/auth/signin/view/user_sign_in_screen.dart';
import 'features/auth/signup/view/choose_screen.dart';
import 'features/auth/signup/view/sponser_register_screen.dart';
import 'features/auth/signup/view/user_register_screen.dart';
import 'features/auth/verify/verifyscreen.dart';
import 'features/auth/verify/verifysponser.dart';
import 'features/donate_an_idea/view/donate_an_idea.dart';
import 'features/sponser/view/getacceptedsponsororder.dart';
import 'features/sponser/view/getwaitingsponsororder.dart';
import 'features/sponser/view/my_orphanes.dart';
import 'features/sponser/view/sponser_home_screen.dart';
import 'features/sponser/view/sponsor_an_orphan.dart';

class GetRoutes {
  static const String login = "/login";
  static const String signup = "/signup";
  static const String home = "/home";
  static const String choosescreen = "/chossescreen";
  static const String sponsersignup = "/sponsersignup";
  static const String dashboared = "/dashboared";
  static const String sponserhomepage = "/sponserhomepage";
  static const String myorphanes = "/myorphanes";
  static const String donateidea = "/donateidea";
  static const String contactwithus = "/contactwithus";
  static const String sponseranorphan = "/sponseranorphan";
  static const String introscreen = "/introscreen";
  static const String resetpassword = "/resetpassword";
  static const String verifysponser = "/verifysponser";
  static const String verify = "/verify";
  static const String getacceptedsponsororder = "/getacceptedsponsororder";
  static const String getawaitingsponsororder = "/getawaitingsponsororder";

  static List<GetPage> route = [
    GetPage(
      name: GetRoutes.login,
      page: () => UserSignInrScreen(),
    ),
    GetPage(name: GetRoutes.signup, page: () => UserRegisterScreen()),
    GetPage(name: GetRoutes.verify, page: () => VerifyScreen()),
    GetPage(
        name: GetRoutes.getacceptedsponsororder,
        page: () => GetAcceptedSponsorOrders()),
    GetPage(name: GetRoutes.verifysponser, page: () => VerifyScreenSponser()),
    GetPage(
        name: GetRoutes.getawaitingsponsororder,
        page: () => GetWaitingSponsorOrders()),
    GetPage(name: GetRoutes.introscreen, page: () => const IntroScreen()),
    GetPage(name: GetRoutes.choosescreen, page: () => const ChooseScreen()),
    GetPage(name: GetRoutes.sponsersignup, page: () => SponserRegisterScreen()),
    GetPage(
      name: GetRoutes.sponserhomepage,
      page: () => SponserHomePage(),
    ),
    GetPage(name: GetRoutes.myorphanes, page: () => MyOrphanes()),
    GetPage(name: GetRoutes.resetpassword, page: () => ResetPassword()),
    GetPage(name: GetRoutes.donateidea, page: () => DonateAnIdea()),
    GetPage(name: GetRoutes.contactwithus, page: () => ContactWithUs()),
    GetPage(
      name: GetRoutes.sponseranorphan,
      page: () => SponserAnOrphane(),
    ),
    // GetPage(
    //   name: GetRoutes.dashboared,
    //   page: () => DashboaredHomePage(),
    // )
  ];
}
