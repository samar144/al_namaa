import 'package:alnamaa_charity/features/Profile/profile_controller.dart';
import 'package:alnamaa_charity/features/Profile/profile_repo.dart';
import 'package:alnamaa_charity/features/auth/signin/controller/signincontroller.dart';
import 'package:alnamaa_charity/features/auth/signup/controller/signupcontroller.dart';
import 'package:alnamaa_charity/features/auth/signup/controller/usersignupcontroller.dart';

import 'package:alnamaa_charity/features/sponser/controller/sponser_home_controller.dart';
import 'package:alnamaa_charity/service/network_handler/network_handler.dart';
import 'package:alnamaa_charity/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => NetworkHandler(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => LoginController(), fenix: true);
  Get.lazyPut(() => UserSignUpController(), fenix: true);
  Get.lazyPut(() => SponsorSignUpController(), fenix: true);
  // Get.lazyPut(() => AllertController(), fenix: true);
  ///////////////////////
  // Get.lazyPut(() => ProfileRepo(networkHandler: Get.find()));
  Get.lazyPut(() => ProfileController(), fenix: true);
  //Get.lazyPut(() => HomeController(), fenix: true);
}
