import 'package:alnamaa_charity/pages/alert/alert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertPage extends GetView<AlertController> {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: Container(
        child: Center(
          child: Text("alert Page"),
        ),
      ),
    );
  }
}
