import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final RxString selectedItem = "سنوي".obs;

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
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023, 1),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      datecontroller.text = picked
          .toString(); // Update the TextController with the selected date.
    }
  }
}
