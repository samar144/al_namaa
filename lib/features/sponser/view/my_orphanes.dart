import 'package:alnamaa_charity/core/widget/text_form_field.dart';
import 'package:alnamaa_charity/routes.dart';
import 'package:alnamaa_charity/utils/baseurl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:get/get.dart';
import '../../../utils/shared_pref/getstorage.dart';
import '../../Profile/profile_controller.dart';
import '../../auth/signup/model/user_register_model.dart';
import '../controller/sponser_an_orohan_controller.dart';
import '../controller/sponser_home_controller.dart';
import 'orphanprofileforsponser.dart';

class MyOrphanes extends StatelessWidget {
  MyOrphanes({super.key});
  final HomeController controller = Get.put(HomeController());
  final SponserAnOrphaneontroller controller1 =
      Get.put(SponserAnOrphaneontroller());
  final GlobalKey<FormState> _formKey10 = GlobalKey<FormState>();

  // final ProfileController controller1 = Get.put(ProfileController());
  UserModel? user = GetStorageUtils().getUser();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 80,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Text(
                      user!.name!.substring(0, 1),
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              elevation: 2,
              title: Text(
                "أيتامي",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.cyan[600]),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.cyan[600],
                  ))),
          body: FutureBuilder<void>(
              future: controller.getorphansponsor(),
              builder: (context, snapshot) {
                return Obx(() {
                  final data = controller.orphanforsponser;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        final item = data[index];
                        return Container(
                          height: 133,
                          width: 333,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.cyan[600],
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(12),
                                  right: Radius.circular(12),
                                ),
                              ),
                              height: 150,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        // GetStorageUtils().saveorphanid(item["orphan"]["id"].toString());
                                        Get.toNamed(GetRoutes.profile);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipOval(
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "$baseUrl${item["orphan"]["photo"]}",
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                                fit: BoxFit.fill,
                                                height: 80,
                                                width: 80,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(item["orphan"]["first_name"]
                                                  .toString() +
                                              " " +
                                              item["orphan"]["last_name"]
                                                  .toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Wrap(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) => Dialog(
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            100,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            3,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const Text(
                                                                  "إلغاء الكفالة"),
                                                              const Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Icon(Icons
                                                                      .warning_outlined),
                                                                  Text(
                                                                      "الرجاء ذكر السبب "),
                                                                ],
                                                              ),
                                                              TextFormFieldWidget(
                                                                label: "",
                                                                controller:
                                                                    controller
                                                                        .notecontroller,
                                                                maxlines: 5,
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Colors
                                                                              .cyan),
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child: const Text(
                                                                          "رجوع")),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      controller
                                                                          .stopsponsorshiporder(
                                                                        item[
                                                                            "sponsorship_id"],
                                                                      );
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors.red),
                                                                    child: const Text(
                                                                        "تأكيد"),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                          },
                                          icon: const Icon(Icons.delete),
                                          tooltip: "حذف",
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                                useSafeArea: true,
                                                context: context,
                                                builder:
                                                    (context) =>
                                                        SingleChildScrollView(
                                                          child: Dialog(
                                                            child: SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  10,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height -
                                                                  10,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    const Text(
                                                                        "تعديل الكفالة"),
                                                                    const Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .edit),
                                                                        Text(
                                                                            "عدل هنا"),
                                                                      ],
                                                                    ),
                                                                    Form(
                                                                        // autovalidateMode:
                                                                        //     AutovalidateMode
                                                                        //         .always,
                                                                        key:
                                                                            _formKey10,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 110,
                                                                              child: Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 1,
                                                                                    child: TextFormFieldWidget(
                                                                                      label: " الاسم الثلاثي للبديل ",
                                                                                      controller: controller1.alternativeNamecontroller,
                                                                                      // validator: (val) {
                                                                                      //   if (val!.isEmpty) {
                                                                                      //     return "مطلوب";
                                                                                      //   }
                                                                                      //   return null;
                                                                                      // }
                                                                                      // ,
                                                                                      keyboaredtype: TextInputType.text,
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                      flex: 1,
                                                                                      child: TextFormFieldWidget(
                                                                                        label: " عنوان البديل",
                                                                                        controller: controller1.alternativeAddresscontroller,
                                                                                        // validator: (val) {
                                                                                        //   if (val!.isEmpty) {
                                                                                        //     return "مطلوب";
                                                                                        //   }
                                                                                        //   return null;
                                                                                        // },
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
                                                                                      controller: controller1.alternativeTelecontroller,
                                                                                      // validator: (val) {
                                                                                      //   if (val!.isEmpty) {
                                                                                      //     return "مطلوب";
                                                                                      //   }
                                                                                      //   return null;
                                                                                      // },
                                                                                      keyboaredtype: TextInputType.number,
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                      flex: 1,
                                                                                      child: TextFormFieldWidget(
                                                                                        label: " رقم الجوال للبديل",
                                                                                        controller: controller1.alternativePhonecontroller,
                                                                                        // validator: (val) {
                                                                                        //   if (val!.isEmpty) {
                                                                                        //     return "مطلوب";
                                                                                        //   }
                                                                                        //   return null;
                                                                                        // },
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
                                                                                    controller: controller1.amountcontroller,
                                                                                    // validator: (val) {
                                                                                    //   if (val!.isEmpty) {
                                                                                    //     return "مطلوب";
                                                                                    //   }
                                                                                    //   return null;
                                                                                    // },
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
                                                                                    // validator: (val) {
                                                                                    //   if (val!.isEmpty) {
                                                                                    //     return "مطلوب";
                                                                                    //   }
                                                                                    //   return null;
                                                                                    // },
                                                                                    keyboaredtype: TextInputType.text,
                                                                                  )),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Obx(
                                                                              () => DropdownButtonFormField<String>(
                                                                                value: controller1.selectedItem.value,
                                                                                items: controller1.items.map((String value) {
                                                                                  return DropdownMenuItem<String>(
                                                                                    value: value,
                                                                                    child: Text(value),
                                                                                  );
                                                                                }).toList(),
                                                                                isExpanded: true,
                                                                                onChanged: (String? value) {
                                                                                  controller1.paymentWaycontroller.text = value!;
                                                                                },
                                                                                decoration: InputDecoration(
                                                                                  labelText: ' طريقة الدفع ',
                                                                                  border: OutlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                      borderSide: const BorderSide(
                                                                                          // color: Color(0xff1ea1a7),
                                                                                          width: 1)),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Color(0xff1ea1a7), width: 1)),
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
                                                                                          // validator: (val) {
                                                                                          //   if (val!.isEmpty) {
                                                                                          //     return "مطلوب";
                                                                                          //   }
                                                                                          //   return null;
                                                                                          // },
                                                                                          controller: controller1.startDatecontroller,
                                                                                          onTap: () async {
                                                                                            // Show the date picker dialog and update the value of _date
                                                                                            DateTime? pickedDate = await DatePicker.showSimpleDatePicker(
                                                                                              context,
                                                                                              initialDate: controller1.date.value,
                                                                                              firstDate: DateTime(1900),
                                                                                              lastDate: DateTime(2100),
                                                                                              dateFormat: "dd-MM-yyyy",
                                                                                              locale: DateTimePickerLocale.en_us,
                                                                                              looping: true,
                                                                                            );
                                                                                            if (pickedDate != null) {
                                                                                              controller1.date.value = pickedDate;
                                                                                              controller1.startDatecontroller.text = pickedDate.toString().substring(0, 10);
                                                                                            }
                                                                                          })),
                                                                                  Expanded(
                                                                                      flex: 1,
                                                                                      child: TextFormFieldWidget(
                                                                                          label: "تاريخ الانتهاء",
                                                                                          // validator: (val) {
                                                                                          //   if (val!.isEmpty) {
                                                                                          //     return "مطلوب";
                                                                                          //   }
                                                                                          //   return null;
                                                                                          // },
                                                                                          controller: controller1.endDatecontroller,
                                                                                          onTap: () async {
                                                                                            // Show the date picker dialog and update the value of _date
                                                                                            DateTime? pickedDate = await DatePicker.showSimpleDatePicker(
                                                                                              context,
                                                                                              initialDate: controller1.date.value,
                                                                                              firstDate: DateTime(1900),
                                                                                              lastDate: DateTime(2100),
                                                                                              dateFormat: "dd-MM-yyyy",
                                                                                              locale: DateTimePickerLocale.en_us,
                                                                                              looping: true,
                                                                                            );
                                                                                            if (pickedDate != null) {
                                                                                              controller1.date.value = pickedDate;
                                                                                              controller1.endDatecontroller.text = pickedDate.toString().substring(0, 10);
                                                                                            }
                                                                                          })),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                                                                            onPressed: () {
                                                                              Get.back();
                                                                            },
                                                                            child: const Text("رجوع")),
                                                                        const SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        ElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            controller1.editsponsorship(
                                                                              item["sponsorship_id"],
                                                                            );
                                                                          },
                                                                          style:
                                                                              ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                                          child:
                                                                              const Text("تأكيد"),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                          },
                                          icon: const Icon(Icons.edit),
                                          tooltip: "تعديل",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
                });
              })),
    );
  }
}
