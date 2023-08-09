import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alnamaa_charity/utils/app_constants.dart';
import '../../../routes.dart';
import '../../../utils/custom_snackbar.dart';
import '../model/guarantees.dart';
import 'package:http/http.dart' as http;

class SponserAnOrphaneontroller extends GetxController {
  @override
  void onInit() {
    amountcontroller = TextEditingController();
    sponserIdcontroller = TextEditingController();
    orphanIdcontroller = TextEditingController();
    paymentWaycontroller = TextEditingController();
    startDatecontroller = TextEditingController();
    endDatecontroller = TextEditingController();
    alternativeNamecontroller = TextEditingController();
    alternativePhonecontroller = TextEditingController();
    alternativeTelecontroller = TextEditingController();
    alternativeAddresscontroller = TextEditingController();
    orderStatuscontroller = TextEditingController();
    approverIdcontroller = TextEditingController();
    datecontroller = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    amountcontroller.dispose();
    sponserIdcontroller.dispose();
    orphanIdcontroller.dispose();
    paymentWaycontroller.dispose();
    datecontroller.dispose();
    startDatecontroller.dispose();
    endDatecontroller.dispose();
    alternativeNamecontroller.dispose();
    alternativePhonecontroller.dispose();
    alternativeTelecontroller.dispose();
    alternativeAddresscontroller.dispose();
    orderStatuscontroller.dispose();
    super.onClose();
  }

  final date = DateTime.now().obs;

  final RxString selectedItem = "سنوي".obs;
  final List<String> items = [
    "سنوي",
    "شهري",
    "ربع سنوي",
    "نصف سنوي",
  ];

  late TextEditingController amountcontroller,
      datecontroller,
      sponserIdcontroller,
      orphanIdcontroller,
      paymentWaycontroller,
      startDatecontroller,
      endDatecontroller,
      alternativeNamecontroller,
      alternativePhonecontroller,
      alternativeTelecontroller,
      alternativeAddresscontroller,
      orderStatuscontroller,
      approverIdcontroller;

// Define a Future function to show the date picker.
  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2023, 1),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null) {
  //     datecontroller.text = picked
  //         .toString(); // Update the TextController with the selected date.
  //   }
  // }

  signup() async {
    Guarantees guarantees = Guarantees(
      alternativeAddress: "",
      alternativeName: "",
      alternativePhone: "",
      alternativeTele: "",
      amount: "",
      approverId: "",
      endDate: "",
      orderStatus: "",
      orphanId: "",
      paymentWay: "",
      sponserId: "",
      startDate: "",
    );
    http.Response response = await http.post(
        Uri.parse(AppConstants.BASE_URL + '/api/app/register'),
        body: guaranteesToJson(guarantees),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });
    var res = await jsonDecode(response.body);
    // print(res);
    if (res["message"] == "the email is available") {
      await customsnackbar("", res['message'], "sucess");
    } else {
      customsnackbar("", res['message'], "error");
    }
  }
}
