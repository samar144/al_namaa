import 'package:alnamaa_charity/core/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/text_form_field.dart';

class ContactWithUs extends StatelessWidget {
  ContactWithUs({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar("تواصل معنا", const [
          CircleAvatar(
            child: Text("H"),
          )
        ]),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  " تواصل مع الجمعية  ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextFormFieldWidget(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "يرجى ملئ الحقل   ";
                    }
                    return null;
                  },
                  hint: "      ",
                  label: "",
                  keyboaredtype: TextInputType.multiline,
                  maxlines: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan[600]),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          child: const Text("إرسال")),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text("إلغاء"),
                          onPressed: () {
                            Get.back();
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
