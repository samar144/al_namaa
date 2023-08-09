import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';

import '../../../core/widget/button.dart';
import '../../../core/widget/text_form_field.dart';
import '../controller/sponser_an_orohan_controller.dart';

class SponserAnOrphane extends StatelessWidget {
  SponserAnOrphane({key});
  final formKey = GlobalKey<FormState>();
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
                        items: controller.items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 110,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormFieldWidget(
                                  label: "تاريخ الميلاد",
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                  controller: controller.startDatecontroller,
                                  onTap: () async {
                                    // Show the date picker dialog and update the value of _date
                                    DateTime? pickedDate =
                                        await DatePicker.showSimpleDatePicker(
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
                                      controller.startDatecontroller.text =
                                          pickedDate
                                              .toString()
                                              .substring(0, 10);
                                    }
                                  })),
                          Expanded(
                              child: TextFormFieldWidget(
                                  label: "تاريخ الميلاد",
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "مطلوب";
                                    }
                                    return null;
                                  },
                                  controller: controller.endDatecontroller,
                                  onTap: () async {
                                    // Show the date picker dialog and update the value of _date
                                    DateTime? pickedDate =
                                        await DatePicker.showSimpleDatePicker(
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
                    CustomButton(name: "إرسال", onPressed: () {})
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
