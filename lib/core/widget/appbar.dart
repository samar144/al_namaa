import 'package:flutter/material.dart';
import 'package:get/get.dart';

CustomAppBar(dynamic title, List<Widget>? widget) {
  return AppBar(
      toolbarHeight: 80,
      actions: widget!,
      backgroundColor: Colors.white,
      elevation: 2,
      title: Text(
        title!,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan[600]),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.backspace_outlined,
            color: Colors.cyan[600],
          )));
}
