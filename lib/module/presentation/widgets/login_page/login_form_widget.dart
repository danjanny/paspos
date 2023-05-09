import 'package:flutter/material.dart';
import 'package:paspos/module/utils/config.dart';
import 'package:paspos/module/utils/dimension.dart';

import '../../../utils/colors.dart';

class LoginFormWidget extends StatelessWidget {
  Widget? suffixIcon;
  TextEditingController? controller;
  String? errorValidationMessage;
  String? hintText;
  bool? obscureText;

  LoginFormWidget(
      {super.key,
      this.controller,
      this.errorValidationMessage,
      this.hintText,
      this.suffixIcon,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorWidth: 1.0,
      style: TextStyle(
          color: PasposColor.formCursorColor,
          fontFamily: PasposConfig.fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: Dimension.formTextSize),
      cursorColor: PasposColor.formCursorColor,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
        filled: true,
        fillColor: PasposColor.formFillColor,
        errorStyle:
            TextStyle(fontFamily: PasposConfig.fontFamily, fontSize: 10.0),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: PasposColor.formFillColor,
                width: 0.0,
                style: BorderStyle.none),
            borderRadius: BorderRadius.circular(Dimension.formBorderRadius)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: PasposColor.formFillColor,
                width: 0.0,
                style: BorderStyle.none),
            borderRadius: BorderRadius.circular(Dimension.formBorderRadius)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: PasposColor.formFillColor,
                width: 0.0,
                style: BorderStyle.none),
            borderRadius: BorderRadius.circular(Dimension.formBorderRadius)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorValidationMessage;
        }
        return null;
      },
    );
  }
}
