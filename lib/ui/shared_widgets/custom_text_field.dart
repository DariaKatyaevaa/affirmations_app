import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon prefixIcon;
  final Function()? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (_) {
        if (onChanged != null) onChanged!.call();
      },
      onSubmitted: (_) {
        if (onChanged != null) onChanged!.call();
      },
      obscureText: obscureText,
      cursorColor: Color(0xff4f4f4f),
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Color(0xfff0f3f1),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintStyle: TextStyle(
          fontSize: 15,
          color: Color(0xff8d8d8d),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: Color(0xff4f4f4f),
        filled: true,
      ),
    );
  }
}
