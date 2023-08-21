import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;

  final Function()? onPressed;

  CustomButton({key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width / 2,
        child: MaterialButton(
            elevation: 5,
            onPressed: onPressed,
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: const Color(0xff1ea1a7),
            child: Text(name,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ))));
  }

  // goTo(String? des) {
  //   Get.toNamed("/$des");
  // }
}
