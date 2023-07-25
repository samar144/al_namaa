import 'package:alnamaa_charity/features/auth/signin/controller/signincontroller.dart';
import 'package:alnamaa_charity/features/auth/signup/controller/signupcontroller.dart';
import 'package:alnamaa_charity/features/auth/signup/controller/usersignupcontroller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => UserSignUpController(), fenix: true);
    Get.lazyPut(() => SponsorSignUpController(), fenix: true);
  }
}
