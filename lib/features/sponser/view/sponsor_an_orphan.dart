import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/button.dart';
import '../../../core/widget/text_form_field.dart';
import '../controller/sponser_an_orohan_controller.dart';

class SponserAnOrphane extends StatelessWidget {
  SponserAnOrphane({super.key});
  final formKey = GlobalKey<FormState>();
  final List<String> items = ['شهري ', 'سنوي', 'ربع سنوي', 'نصف سنوي'];
  final SponserAnOrphaneontroller controller = Get.find();
// /  final TextEditingController _dateController = TextEditingController();

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
        body: Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 12),
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 110,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormFieldWidget(
                              label: " الاسم الثلاثي",
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
                              child: TextFormFieldWidget(
                            label: " العنوان",
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "مطلوب";
                              }
                              return null;
                            },
                            keyboaredtype: TextInputType.text,
                          )),
                          Expanded(
                              child: TextFormFieldWidget(
                            label: " رقم الهاتف",
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
                      height: 10,
                    ),
                    SizedBox(
                      height: 110,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormFieldWidget(
                              label: " الاسم الثلاثي للبديل ",
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
                              child: TextFormFieldWidget(
                            label: " العنوان",
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "مطلوب";
                              }
                              return null;
                            },
                            keyboaredtype: TextInputType.text,
                          )),
                          Expanded(
                              child: TextFormFieldWidget(
                            label: " رقم الهاتف",
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
                      height: 10,
                    ),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        value: controller.selectedItem.value,
                        items: items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          // controller.paymentWaycontroller = value!;
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 110,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormFieldWidget(
                              label: "   تاريخ البدء ",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "مطلوب";
                                }
                                return null;
                              },
                              keyboaredtype: TextInputType.datetime,
                            ),
                          ),
                          Expanded(
                              child: TextFormFieldWidget(
                            label: " تاريخ الانتهاء",
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "مطلوب";
                              }
                              return null;
                            },
                            keyboaredtype: TextInputType.datetime,
                          )),
                        ],
                      ),
                    ),
                    CustomButton(name: "إرسال", onPressed: () {})
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
