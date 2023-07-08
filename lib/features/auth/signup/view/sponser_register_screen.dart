import 'package:alnamaa_charity/features/auth/signup/controller/signupcontroller.dart';
import 'package:alnamaa_charity/core/widget/alnamaa_logo.dart';
import 'package:alnamaa_charity/core/widget/text_form_field.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import '../../../../extra/regex.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text_form_field_pass_word.dart';

class SponserRegisterScreen extends StatelessWidget {
  final UserRegisterController registercontroller =
      Get.put(UserRegisterController());
  final formKey = GlobalKey<FormState>();

  SponserRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ListView(children: [
            GetBuilder<UserRegisterController>(builder: (registercontroller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logo(
                    height: 210.0,
                    width: 210.0,
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
                                  controller: registercontroller
                                      .firstnameEditController,
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
                                controller:
                                    registercontroller.lastnameEditController,
                              )),
                              Expanded(
                                child: TextFormFieldWidget(
                                  label: "اسم الأب",
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                  controller: registercontroller
                                      .fathernameEditController,
                                ),
                              ),
                              Expanded(
                                  child: TextFormFieldWidget(
                                label: "اسم الأم",
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "مطلوب";
                                  }
                                  return null;
                                },
                                controller:
                                    registercontroller.mothernameEditController,
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
                                  controller: registercontroller
                                      .mobilephoneEditController,
                                  label: "رقم الموبايل",
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                  keyboaredtype: TextInputType.phone,
                                  icon: const Icon(Icons.phone_android),
                                ),
                              ),
                              Expanded(
                                  child: TextFormFieldWidget(
                                label: "رقم الأرضي",
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "مطلوب";
                                  }
                                  return null;
                                },
                                controller:
                                    registercontroller.telephoneEditController,
                                keyboaredtype: TextInputType.phone,
                                icon: const Icon(Icons.phone),
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
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                  controller:
                                      registercontroller.cityEditController,
                                ),
                              ),
                              Expanded(
                                child: TextFormFieldWidget(
                                  label: "العمل",
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
                                  label: "الدراسة",
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                  controller:
                                      registercontroller.studyEditController,
                                ),
                              ),
                              Expanded(
                                  child: TextFormFieldWidget(
                                      label: "تاريخ الميلاد",
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "مطلوب";
                                        }
                                        return null;
                                      },
                                      controller: registercontroller
                                          .birthdayEditController,
                                      onTap: () async {
                                        // Show the date picker dialog and update the value of _date
                                        DateTime? pickedDate = await DatePicker
                                            .showSimpleDatePicker(
                                          context,
                                          initialDate:
                                              registercontroller.date.value,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100),
                                          dateFormat: "dd-MMMM-yyyy",
                                          locale: DateTimePickerLocale.en_us,
                                          looping: true,
                                        );
                                        if (pickedDate != null) {
                                          registercontroller.date.value =
                                              pickedDate;
                                          registercontroller
                                                  .birthdayEditController.text =
                                              pickedDate
                                                  .toString()
                                                  .substring(0, 10);
                                        }
                                      })),
                            ],
                          ),
                        ),
                        TextFormFieldWidget(
                          validator: (val) {
                            if (!emailRegex.hasMatch(
                                registercontroller.emailEditController.text)) {
                              return "example@example.com";
                            }
                            return null;
                          },
                          label: "الايميل :",
                          hint: "ادخل الايميل ",
                          icon: const Icon(Icons.email),
                          keyboaredtype: TextInputType.emailAddress,
                          controller: registercontroller.emailEditController,
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
                      Get.toNamed(GetRoutes.signup);
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
                    name: " إنشاء حساب",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        registercontroller.signup();
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
