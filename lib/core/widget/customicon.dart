import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  const CustomIcon({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.scaleDown,
      width: width,
      height: height,
    );
  }
}
