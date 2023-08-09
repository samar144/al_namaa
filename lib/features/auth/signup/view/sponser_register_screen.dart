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
  final SponsorSignUpController registercontroller =
      Get.put(SponsorSignUpController());
  // final SponsorSignUpController registercontroller = Get.find();
  final formKey = GlobalKey<FormState>();

  SponserRegisterScreen({key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ListView(children: [
            GetBuilder<SponsorSignUpController>(builder: (registercontroller) {
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
                                    controller: registercontroller
                                        .lastnameEditController,
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
                                    controller: registercontroller
                                        .mothernameEditController,
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
                                        label: "رقم الموبايل",
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "مطلوب";
                                          }
                                          return null;
                                        },
                                        keyboaredtype: TextInputType.phone,
                                        icon: const Icon(Icons.phone_android),
                                        controller: registercontroller
                                            .phonenumberEditController),
                                  ),
                                  Expanded(
                                      child: TextFormFieldWidget(
                                    label: "رقم الأرضي",
                                    // validator: (val) {
                                    //   if (val!.isEmpty) {
                                    //     return "مطلوب";
                                    //   }
                                    //   return null;
                                    // },
                                    controller: registercontroller
                                        .telephoneEditController,
                                    keyboaredtype: TextInputType.phone,
                                    icon: const Icon(Icons.phone),
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => DropdownButtonFormField<String>(
                                      value: registercontroller
                                          .selectedcountry.value,
                                      items: registercontroller.country
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      isExpanded: true,
                                      onChanged: (String? value) {
                                        registercontroller.countryEditController
                                            .text = value!;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'الدولة ',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                // color: Color(0xff1ea1a7),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Color(0xff1ea1a7),
                                                width: 1)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Obx(
                                    () => DropdownButtonFormField<String>(
                                      value: registercontroller
                                          .selectedstate.value,
                                      items: registercontroller.state
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      isExpanded: true,
                                      onChanged: (String? value) {
                                        registercontroller
                                            .stateEditController.text = value!;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'المحافظة',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                // color: Color(0xff1ea1a7),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Color(0xff1ea1a7),
                                                width: 1)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Obx(
                                        () => DropdownButtonFormField<String>(
                                          value: registercontroller
                                              .selectedcity.value,
                                          items: registercontroller.city
                                              .map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          isExpanded: true,
                                          onChanged: (String? value) {
                                            registercontroller
                                                .cityEditController
                                                .text = value!;
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'المدينة',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    // color: Color(0xff1ea1a7),
                                                    width: 1)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Color(0xff1ea1a7),
                                                    width: 1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Obx(
                                        () => DropdownButtonFormField<String>(
                                          value: registercontroller
                                              .selectedstreet.value,
                                          items: registercontroller.street
                                              .map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          isExpanded: true,
                                          onChanged: (String? value) {
                                            registercontroller
                                                .streetEditController
                                                .text = value!;
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'الشارع',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    // color: Color(0xff1ea1a7),
                                                    width: 1)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Color(0xff1ea1a7),
                                                    width: 1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 110,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormFieldWidget(
                                          label: "العمل",
                                          // validator: (val) {
                                          //   if (val!.isEmpty) {
                                          //     return "مطلوب";
                                          //   }
                                          //   return null;
                                          // },
                                          controller: registercontroller
                                              .jobEditController,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormFieldWidget(
                                          label: "الدراسة",
                                          // validator: (val) {
                                          //   if (val!.isEmpty) {
                                          //     return "مطلوب";
                                          //   }
                                          //   return null;
                                          // },
                                          controller: registercontroller
                                              .studyEditController,
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
                                                DateTime? pickedDate =
                                                    await DatePicker
                                                        .showSimpleDatePicker(
                                                  context,
                                                  initialDate:
                                                      registercontroller
                                                          .date.value,
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2100),
                                                  dateFormat: "dd-MM-yyyy",
                                                  locale: DateTimePickerLocale
                                                      .en_us,
                                                  looping: true,
                                                );
                                                if (pickedDate != null) {
                                                  registercontroller
                                                      .date.value = pickedDate;
                                                  registercontroller
                                                          .birthdayEditController
                                                          .text =
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
                                    if (!emailRegex.hasMatch(registercontroller
                                        .emailEditController.text)) {
                                      return "example@example.com";
                                    }
                                    return null;
                                  },
                                  label: "الايميل :",
                                  hint: "ادخل الايميل ",
                                  icon: const Icon(Icons.email),
                                  keyboaredtype: TextInputType.emailAddress,
                                  controller:
                                      registercontroller.emailEditController,
                                ),
                                TextFormFieldPasswordWidget(
                                  label: "كلمة السر",
                                  controller:
                                      registercontroller.passwordEditController,
                                  hint: "ادخل كلمة السر ",
                                  icon: const Icon(Icons.password),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(GetRoutes.login);
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
                                  registercontroller.checksignup();
                                }
                              },
                            )
                          ],
                        ))
                  ]);
            }),
          ]),
        ),
      ),
    );
  }
}
