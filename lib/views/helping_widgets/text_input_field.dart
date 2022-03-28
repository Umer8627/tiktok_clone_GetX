import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant/constant.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObsecure;
  final IconData icon;

  const TextInputField(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.isObsecure = false,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          labelStyle: TextStyle(fontSize: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: borderColor))),
      obscureText: isObsecure,
    );
  }
}
