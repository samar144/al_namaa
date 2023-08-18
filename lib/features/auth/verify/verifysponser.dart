import 'package:alnamaa_charity/features/auth/signin/controller/signincontroller.dart';
import 'package:alnamaa_charity/core/widget/alnamaa_logo.dart';
import 'package:alnamaa_charity/core/widget/text_form_field.dart';
import 'package:alnamaa_charity/features/auth/signup/controller/signupcontroller.dart';
import 'package:alnamaa_charity/features/auth/signup/controller/usersignupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widget/button.dart';

class VerifyScreenSponser extends StatelessWidget {
  // VerifyScreenSponser({super.key});
  final SponsorSignUpController controller = Get.put(SponsorSignUpController());
  final GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Logo(
                      height: 210.0,
                      width: 210.0,
                    ),
                  ),
                  const Text(
                    " تأكيد الحساب",
                    style: TextStyle(color: Color(0xff1ea1a7), fontSize: 18),
                  ),
                  GetBuilder<SponsorSignUpController>(
                      builder: (loginController) {
                    return Column(
                      children: [
                        Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: _formKey5,
                          child: Column(
                            children: [
                              TextFormFieldWidget(
                                validator: (val) {
                                  if (controller
                                      .verifyEditController.text.isEmpty) {
                                    return "مطلوب";
                                  }
                                  return null;
                                },
                                label: "الكود :",
                                hint: "ادخل الكود ",
                                controller: controller.verifyEditController,
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          name: "ارسال",
                          onPressed: () {
                            if (_formKey5.currentState!.validate()) {
                              controller.verifyemail();
                            }
                          },
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
