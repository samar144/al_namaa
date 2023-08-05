import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120.0),
            image: const DecorationImage(
                image: AssetImage("assets/images/1.png"))),
      ),
    );
  }
}
