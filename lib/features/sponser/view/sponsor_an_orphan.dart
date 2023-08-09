import 'package:alnamaa_charity/features/auth/signup/model/user_register_model.dart';
import 'package:alnamaa_charity/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';

import '../../../core/widget/button.dart';
import '../../../core/widget/text_form_field.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../controller/sponser_an_orohan_controller.dart';

class SponserAnOrphane extends StatelessWidget {
  UserModel? user = GetStorageUtils().getUser();

  // SponserAnOrphane({super.key});
  var formKey7 = GlobalKey<FormState>();
  // UserModel user = Get.arguments;

  final SponserAnOrphaneontroller controller =
      Get.put(SponserAnOrphaneontroller());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            actions: const [
              CircleAvatar(
                child: Text("H"),
              ),
            ],
            backgroundColor: Colors.white,
            elevation: 2,
            title: Text(
              "اكفل يتيم",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.cyan[600]),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.backspace_outlined,
                  color: Colors.cyan[600],
                ))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
            child: GetBuilder<SponserAnOrphaneontroller>(builder: (con) {
              return Column(
                children: [
                  Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: formKey7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 110,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormFieldWidget(
                                    label: " الاسم الثلاثي للبديل ",
                                    controller:
                                        controller.alternativeNamecontroller,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "مطلوب";
                                      }
                                      return null;
                                    },
                                    keyboaredtype: TextInputType.text,
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: TextFormFieldWidget(
                                      label: " عنوان البديل",
                                      controller: controller
                                          .alternativeAddresscontroller,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "مطلوب";
                                        }
                                        return null;
                                      },
                                      keyboaredtype: TextInputType.text,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 110,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormFieldWidget(
                                    label: " رقم الارضي للبديل ",
                                    controller:
                                        controller.alternativeTelecontroller,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "مطلوب";
                                      }
                                      return null;
                                    },
                                    keyboaredtype: TextInputType.number,
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: TextFormFieldWidget(
                                      label: " رقم الجوال للبديل",
                                      controller:
                                          controller.alternativePhonecontroller,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "مطلوب";
                                        }
                                        return null;
                                      },
                                      keyboaredtype: TextInputType.phone,
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
                                  label: "المبلغ",
                                  hint: "المبلغ بالليرة السورية",
                                  controller: controller.amountcontroller,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                  keyboaredtype: TextInputType.number,
                                )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 215,
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextFormFieldWidget(
                                  label: "ملاحظات",
                                  controller: controller.notecontroller,
                                  maxlines: 6,
                                  hint: "كفالة تحت 5 سنوات او اكثر ",
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                  keyboaredtype: TextInputType.text,
                                )),
                              ],
                            ),
                          ),
                          Obx(
                            () => DropdownButtonFormField<String>(
                              value: controller.selectedItem.value,
                              items: controller.items.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              isExpanded: true,
                              onChanged: (String? value) {
                                controller.paymentWaycontroller.text = value!;
                              },
                              decoration: InputDecoration(
                                labelText: ' طريقة الدفع ',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        // color: Color(0xff1ea1a7),
                                        width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xff1ea1a7), width: 1)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 110,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: TextFormFieldWidget(
                                        label: "تاريخ البدء",
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "مطلوب";
                                          }
                                          return null;
                                        },
                                        controller:
                                            controller.startDatecontroller,
                                        onTap: () async {
                                          // Show the date picker dialog and update the value of _date
                                          DateTime? pickedDate =
                                              await DatePicker
                                                  .showSimpleDatePicker(
                                            context,
                                            initialDate: controller.date.value,
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                            dateFormat: "dd-MM-yyyy",
                                            locale: DateTimePickerLocale.en_us,
                                            looping: true,
                                          );
                                          if (pickedDate != null) {
                                            controller.date.value = pickedDate;
                                            controller
                                                    .startDatecontroller.text =
                                                pickedDate
                                                    .toString()
                                                    .substring(0, 10);
                                          }
                                        })),
                                Expanded(
                                    flex: 1,
                                    child: TextFormFieldWidget(
                                        label: "تاريخ الانتهاء",
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "مطلوب";
                                          }
                                          return null;
                                        },
                                        controller:
                                            controller.endDatecontroller,
                                        onTap: () async {
                                          // Show the date picker dialog and update the value of _date
                                          DateTime? pickedDate =
                                              await DatePicker
                                                  .showSimpleDatePicker(
                                            context,
                                            initialDate: controller.date.value,
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                            dateFormat: "dd-MM-yyyy",
                                            locale: DateTimePickerLocale.en_us,
                                            looping: true,
                                          );
                                          if (pickedDate != null) {
                                            controller.date.value = pickedDate;
                                            controller.endDatecontroller.text =
                                                pickedDate
                                                    .toString()
                                                    .substring(0, 10);
                                          }
                                        })),
                              ],
                            ),
                          ),
                        ],
                      )),
                  CustomButton(
                      name: "إرسال",
                      onPressed: () async {
                        if (formKey7.currentState!.validate()) {
                          controller.createsponsorshiporder(
                              user!.user_id!.toString(),
                              user!.token.toString());
                          // Get.back();
                        }
                      })
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
