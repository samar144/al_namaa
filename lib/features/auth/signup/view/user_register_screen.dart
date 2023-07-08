import 'package:alnamaa_charity/features/auth/signup/controller/signupcontroller.dart';
import 'package:alnamaa_charity/core/widget/alnamaa_logo.dart';
import 'package:alnamaa_charity/core/widget/text_form_field.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../extra/regex.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text_form_field_pass_word.dart';

class UserRegisterScreen extends StatelessWidget {
  final UserRegisterController registercontroller =
      Get.put(UserRegisterController());
  final formKey = GlobalKey<FormState>();

  UserRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ListView(children: [
            GetBuilder<UserRegisterController>(builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logo(
                    height: 200.0,
                    width: 200.0,
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 110,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormFieldWidget(
                                  controller:
                                      controller.firstnameEditController,
                                  label: "الاسم الاول",
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                  child: TextFormFieldWidget(
                                label: "الاسم الاخير",
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "مطلوب";
                                  }
                                  return null;
                                },
                                controller: controller.lastnameEditController,
                              )),
                              Expanded(
                                child: TextFormFieldWidget(
                                  label: "اسم الأب",
                                  controller:
                                      controller.fathernameEditController,
                                ),
                              ),
                              Expanded(
                                  child: TextFormFieldWidget(
                                label: "اسم الأم",
                                controller: controller.mothernameEditController,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormFieldWidget(
                                  controller:
                                      controller.mobilephoneEditController,
                                  label: "رقم الموبايل",
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                  keyboaredtype: TextInputType.phone,
                                  icon: Icon(Icons.phone_android),
                                ),
                              ),
                              Expanded(
                                  child: TextFormFieldWidget(
                                label: "رقم الأرضي",
                                controller: controller.telephoneEditController,
                                keyboaredtype: TextInputType.phone,
                                icon: Icon(Icons.phone),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormFieldWidget(
                                  label: "المدينة",
                                  controller: controller.cityEditController,
                                ),
                              ),
                              const Expanded(
                                  child: TextFormFieldWidget(label: "العمل")),
                              Expanded(
                                child: TextFormFieldWidget(
                                  label: "الدراسة",
                                  controller: controller.studyEditController,
                                ),
                              ),
                              Expanded(
                                  child: TextFormFieldWidget(
                                label: "تاريخ الميلاد",
                                controller: controller.birthdayEditController,
                                keyboaredtype: TextInputType.datetime,
                              )),
                            ],
                          ),
                        ),
                        TextFormFieldWidget(
                          validator: (val) {
                            if (!emailRegex.hasMatch(
                                controller.emailEditController.text)) {
                              return "example@example.com";
                            }
                            return null;
                          },
                          label: "الايميل :",
                          hint: "ادخل الايميل ",
                          icon: const Icon(Icons.email),
                          keyboaredtype: TextInputType.emailAddress,
                          controller: controller.emailEditController,
                        ),
                        TextFormFieldPasswordWidget(
                          label: "كلمة السر",
                          controller: registercontroller.passwordEditController,
                          hint: "ادخل كلمة السر ",
                          icon: const Icon(Icons.password),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(GetRoutes.login);
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: ' لديك حساب مسبقاً؟  ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'تسجيل الدخول',
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
                    name: "إنشاء حساب",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.checksignup();
                      }
                    },
                  )
                ],
              );
            }),
          ]),
        ),
      ),
    );
  }
}
