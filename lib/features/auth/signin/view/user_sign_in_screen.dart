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

class UserSignInrScreen extends StatelessWidget {
  UserSignInrScreen({key});
  final LoginController loginController = Get.put(LoginController());
  // final LoginController loginController = Get.find();
  final formKey = GlobalKey<FormState>();

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
                  GetBuilder<LoginController>(builder: (loginController) {
                    return Column(
                      children: [
                        Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: formKey,
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (emailRegex.hasMatch(loginController
                                                .emailEditController.text) &&
                                            loginController.emailEditController
                                                .text.isNotEmpty) {
                                          loginController.forgetpassword();
                                          Get.toNamed(GetRoutes.resetpassword);
                                        } else {
                                          customsnackbar(
                                              "تنبيه",
                                              "الرجاء ملئ حقل الايميل",
                                              "error");
                                        }
                                      },
                                      child: RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'نسيت كلمة المرور ؟',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(GetRoutes.choosescreen);
                          },
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: ' ليس لديك حساب؟ ',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '   إنشاء حساب',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomButton(
                          name: " تسجيل الدخول",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              loginController.checklogin();
                            }
                          },
                        ),
                        CustomButton(
                          name: "الدخول كزائر",
                          onPressed: () {},
                        )
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
