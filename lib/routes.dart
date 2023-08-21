import 'package:alnamaa_charity/features/Profile/main_profile.dart';
import 'package:alnamaa_charity/features/Profile/profile_model.dart';
import 'package:alnamaa_charity/features/advertisements/model/advertisement_model.dart';
import 'package:alnamaa_charity/features/comments_reply/model/comment_model.dart';
import 'package:alnamaa_charity/features/comments_reply/view/commentpage.dart';
import 'package:alnamaa_charity/features/comments_reply/view/replypage.dart';
import 'package:alnamaa_charity/features/contact_with_us/view/contact_with_us_screen.dart';
import 'package:alnamaa_charity/features/courses/my_courses.dart';
import 'package:alnamaa_charity/features/sponser/view/orphan_home_screen.dart';
import 'package:alnamaa_charity/pages/dashboared/dashboared_binding.dart';
import 'package:alnamaa_charity/pages/dashboared/dashboared_page.dart';
import 'package:get/get.dart';

import 'core/page/introduction_screen.dart';
import 'features/advertisements/view/advertismenthome.dart';
import 'features/advertisements/view/entirtaiment.dart';
import 'features/advertisements/view/remmeberads.dart';
import 'features/advertisements/view/training.dart';
import 'features/auth/signin/view/resetpassword.dart';
import 'features/auth/signin/view/user_sign_in_screen.dart';
import 'features/auth/signup/view/choose_screen.dart';
import 'features/auth/signup/view/sponser_register_screen.dart';
import 'features/auth/signup/view/user_register_screen.dart';
import 'features/auth/verify/verifyscreen.dart';
import 'features/auth/verify/verifysponser.dart';
import 'features/donate_an_idea/view/donate_an_idea.dart';
import 'features/sponser/view/editsponsorship.dart';
import 'features/sponser/view/getacceptedsponsororder.dart';
import 'features/sponser/view/getwaitingsponsororder.dart';
import 'features/sponser/view/my_orphanes.dart';
import 'features/sponser/view/orphanprofileforsponser.dart';
import 'features/sponser/view/sponser_home_screen.dart';
import 'features/sponser/view/sponsor_an_orphan.dart';
import 'features/sponser/view/sponsorprofile.dart';

class GetRoutes {
  static const String login = "/login";
  static const String sponsorprofile = "/sponsorprofile";
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
  static const String adswithcourse = "/adswithcourse";
  static const String trainingads = "/trainingads";
  static const String entertaimentadvertisementPage =
      "/entertaimentadvertisementPage";
  static const String remmemberAdvertisementPage =
      "/remmemberAdvertisementPage";

  static const String profile = "/profile";
  static const String editSponsorship = "/editSponsorship";
  static const String courses = "/courses";
  static const String orphanhomepage = "/orphanhomepage";
  static const String commentpage = "/commentpage";
  static const String replypage = "/replypage";
  static const String orphanprofileforsponser = "/orphanprofileforsponser";
  static const String getacceptedsponsororder = "/getacceptedsponsororder";
  static const String getawaitingsponsororder = "/getawaitingsponsororder";

  static List<GetPage> route = [
    GetPage(
      name: GetRoutes.login,
      page: () => UserSignInrScreen(),
    ),
    GetPage(
      name: GetRoutes.adswithcourse,
      page: () => AdvertisementPage(),
    ),
    // GetPage(
    //   name: GetRoutes.replypage,
    //   page: () => ReplyPage(comment: Commentmodel()),
    // ),
    // GetPage(
    //   name: GetRoutes.commentpage,
    //   page: () => CommentPage(
    //     advertisement: AdvertismentModel(),
    //   ),
    // ),
    // GetPage(
    //   name: GetRoutes.entertaimentadvertisementPage,
    //   page: () => EntertaimentAdvertisementPage(),
    // ),
    // GetPage(
    //   name: GetRoutes.remmemberAdvertisementPage,
    //   page: () => RemmemberAdvertisementPage(),
    // ),
    //   GetPage(
    //   name: GetRoutes.trainingads,
    //   page: () => TrainingAdvertisementPage(),
    //   transition: Transition.fadeIn,
    // ),

    GetPage(
      name: GetRoutes.signup,
      page: () => UserRegisterScreen(),
      transition: Transition.fadeIn,
    ),
    // GetPage(
    //   name: GetRoutes.orphanprofileforsponser,
    //   page: () => const Orphanprof1ileForSponser(),
    // ),
    GetPage(
      name: GetRoutes.verify,
      page: () => VerifyScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.editSponsorship,
      page: () => EditSponsorship(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: GetRoutes.introscreen,
      page: () => const IntroScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.choosescreen,
      page: () => const ChooseScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.sponsorprofile,
      page: () => SponsorProfile(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.sponsersignup,
      page: () => SponserRegisterScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.sponserhomepage,
      page: () => SponserHomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.myorphanes,
      page: () => MyOrphanes(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.resetpassword,
      page: () => ResetPassword(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.donateidea,
      page: () => DonateAnIdea(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.contactwithus,
      page: () => ContactWithUs(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.sponseranorphan,
      page: () => SponserAnOrphane(),
    ),
    GetPage(
      name: GetRoutes.dashboared,
      page: () => DashboaredHomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: profile,
      page: () => MainProfile(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: GetRoutes.courses,
      page: () => MyCourses(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: GetRoutes.orphanhomepage,
      page: () => OrphanHomePage(),
      transition: Transition.fadeIn,
    ),
///////////

    GetPage(
        name: GetRoutes.getacceptedsponsororder,
        page: () => GetAcceptedSponsorOrders()),
    GetPage(name: GetRoutes.verifysponser, page: () => VerifyScreenSponser()),
    GetPage(
        name: GetRoutes.getawaitingsponsororder,
        page: () => GetWaitingSponsorOrders()),
  ];
}
