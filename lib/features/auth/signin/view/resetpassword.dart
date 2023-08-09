import 'package:alnamaa_charity/features/auth/signin/controller/signincontroller.dart';
import 'package:alnamaa_charity/extra/regex.dart';
import 'package:alnamaa_charity/core/widget/alnamaa_logo.dart';
import 'package:alnamaa_charity/core/widget/text_form_field.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:alnamaa_charity/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widget/button.dart';
import '../../../../core/widget/text_form_field_pass_word.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({key});
  final LoginController loginController = Get.put(LoginController());
  // final LoginController loginController = Get.find();
  final formKey1 = GlobalKey<FormState>();

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
                    "إعادة تعيين كلمة المرور",
                    style: TextStyle(color: Color(0xff1ea1a7), fontSize: 18),
                  ),
                  GetBuilder<LoginController>(builder: (loginController) {
                    return Column(
                      children: [
                        Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: formKey1,
                          child: Column(
                            children: [
                              TextFormFieldWidget(
                                validator: (val) {
                                  if (!emailRegex.hasMatch(loginController
                                          .emailEditController.text) &&
                                      loginController.emailEditController.text
                                          .isNotEmpty) {
                                    return "example@example.com";
                                  }
                                  return null;
                                },
                                label: "الايميل :",
                                hint: "ادخل الايميل ",
                                icon: const Icon(Icons.email),
                                controller: loginController.emailEditController,
                                keyboaredtype: TextInputType.emailAddress,
                              ),
                              TextFormFieldPasswordWidget(
                                label: "كلمة السر",
                                hint: "ادخل كلمة السر ",
                                icon: const Icon(Icons.password),
                                controller:
                                    loginController.passwordEditController,
                              ),
                              TextFormFieldPasswordWidget(
                                label: " تأكيد كلمة السر",
                                hint: "تأكيد كلمة السر ",
                                controller:
                                    loginController.cpasswordEditController,
                              ),
                              TextFormFieldWidget(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "مطلوب";
                                  }
                                  return null;
                                },
                                label: " ادخل الكود ",
                                hint: "لقد استلمت كود على ايميلك ادخله هنا",
                                icon: const Icon(Icons.password),
                                controller: loginController.tokenEditController,
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          name: "ارسال",
                          onPressed: () {
                            if (formKey1.currentState!.validate() &&
                                loginController.passwordEditController.text ==
                                    loginController
                                        .cpasswordEditController.text) {
                              loginController.resetpassword();
                            } else {
                              customsnackbar(
                                  "ُERROR",
                                  "تأكد من ملئ الحقول وتطابق كلمة السر",
                                  "error");
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
