import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function Validator,
  required String validatorMassage,
  String? labelText,
  Icon? prefixIcon,
  Icon? suffix,
  Function? suffixPressed,
  Color? cursorColor,
  String? hintText,
  TextStyle? labelStyle,
  TextStyle? hintStyle,
  OutlineInputBorder? enabledBorder,
  TextStyle? floatingLabelStyle,
  OutlineInputBorder? focusedBorder,
}) =>
    TextFormField(
      controller: controller,
      cursorColor: cursorColor,
      keyboardType: type,
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMassage;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: suffix,
              )
            : null,
        border: enabledBorder,
        labelStyle: labelStyle,
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
        floatingLabelStyle: floatingLabelStyle,
        focusedBorder: focusedBorder,
      ),
    );

Widget CustomDivider({required Color color, required double height}) =>
    Container(
      width: double.infinity,
      height: height,
      color: color,
    );
