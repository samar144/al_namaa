import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/text_form_field.dart';
import '../controller/donate_an_idea_controller.dart';

class DonateAnIdea extends StatelessWidget {
  //DonateAnIdea({super.key});
  final GlobalKey<FormState> _formKey8 = GlobalKey<FormState>();

  final DonateAnIdeaController cont = Get.put(DonateAnIdeaController());

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
              "تبرع بفكرة",
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
        body: GetBuilder<DonateAnIdeaController>(builder: (controller) {
          return Form(
            key: _formKey8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "شاركنا بعض الأفكار ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextFormFieldWidget(
                    hint: "عنوان الفكرة  ",
                    controller: controller.ideatitleEditController,
                    label: "",
                    keyboaredtype: TextInputType.number,
                  ),
                  TextFormFieldWidget(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "يرجى ادخال الفكرة  ";
                      }
                      return null;
                    },
                    controller: controller.ideaEditController,
                    hint: "ادخل الفكرة مع بعض الشرح ... ",
                    label: "",
                    keyboaredtype: TextInputType.multiline,
                    maxlines: 15,
                  ),
                  TextFormFieldWidget(
                    controller: controller.costEditController,
                    hint: "الكلفة التقديرية المتوقعة",
                    label: "",
                    keyboaredtype: TextInputType.number,
                  ),
                  TextFormFieldWidget(
                    controller: controller.profitEditController,
                    hint: "العوائد التقديرية المتوقعة",
                    label: "",
                    keyboaredtype: TextInputType.number,
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
                              if (_formKey8.currentState!.validate()) {
                                controller.donateanidea();
                              }
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
          );
        }),
      ),
    );
  }
}
