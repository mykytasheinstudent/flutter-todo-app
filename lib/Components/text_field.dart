import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  //
  final String labelText;
  final bool isObscure;
  final IconData? prefixIcon;
  //

  const CustomTextField({
    Key? key,
    //
    required this.labelText,
    this.isObscure = false,
    this.prefixIcon,
    //
  }) : super(key:key);

  @override
  Widget build(BuildContext context){
    //
    //
    //

    return TextField(
      //
      obscureText: isObscure,
      style: const TextStyle(
        color: Color(0xFF192252),
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: const Color(0xFF999999))
            : null,
        labelStyle: TextStyle(
          color: const Color(0xFF999999),
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF565454),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF565454),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        )
      ),
    );
  }
}