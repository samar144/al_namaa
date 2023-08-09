import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Icon icon;
  final String describtion;
  final Function() onTap;
  const CustomListTile(
      {key,
      required this.icon,
      required this.describtion,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(describtion),
      onTap: onTap,
    );
  }
}
