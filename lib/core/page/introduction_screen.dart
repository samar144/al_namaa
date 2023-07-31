import 'package:alnamaa_charity/core/widget/button.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  List<PageViewModel> getpages() {
    return [
      PageViewModel(
          image: Image.asset("images/1686759417790.jpg"),
          title: "",
          decoration: const PageDecoration(
              bodyTextStyle: TextStyle(color: Color(0xff35abb0))),
          body:
              "  ساعد طفلا للحصول على فرصة افضل في الحياة هل ترغب في عمل فرق في حياة طفل يتيم؟  "),
      PageViewModel(
          image: Image.asset("images/1686759417802.jpg"),
          title: "",
          decoration: const PageDecoration(
              bodyTextStyle: TextStyle(color: Color(0xff35abb0))),
          body:
              "ساعدنا في توفير الغذاء والملابس والتعليم والرعاية الصحية لهؤلاء الاطفال"),
      PageViewModel(
          image: Image.asset(
            "images/1686759417811.jpg",
          ),
          title: "",
          decoration: const PageDecoration(
              imageFlex: 5,
              bodyFlex: 2,
              footerFlex: 1,
              bodyTextStyle: TextStyle(color: Color(0xff35abb0))),
          footer: CustomButton(
            name: "يا مرحباً فلنبدأ",
            onPressed: () {
              Get.offAllNamed(GetRoutes.login);
            },
          ),
          body:
              "انضم الى مجتمعنا من المتبرعين والكفلاء الذين يساهمون في تحسين حياة الايتام والاطفال المحتاجين")
    ];
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('showedIntroduction', true);
    });
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: IntroductionScreen(
              next: const Text("التالي"),
              // showNextButton: false,
              showDoneButton: false,
              back: const Text("رجوع"),
              showBackButton: true,
              pages: getpages(),
              globalBackgroundColor: Colors.white,
              allowImplicitScrolling: true,
            ),
          ),
        ),
      ),
    );
  }
}
