// Make Text View
import 'package:flutter/cupertino.dart';

Widget CustomText({
  // String is show
  required String text,
  // color of this String
  Color? textColor,
  // Font Size of this String
  double? textFontSize,
  // Font Weight is this String
  FontWeight? textFontWeight,
  // the Space between the letter
  double? textletterSpacing,
  // the Space between the word
  double? textwordSpacing,
  // make line up or down the word
  TextDecoration? textDecoration,
  // color of this Decoration
  Color? textDecorationColor,
  // Color of backgroundColor to this text
  Color? textbackgroundColor,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Text(text,
          style: TextStyle(
            color: textColor,
            fontSize: textFontSize,
            fontWeight: textFontWeight,
            letterSpacing: textletterSpacing,
            wordSpacing: textwordSpacing,
            decoration: textDecoration,
            decorationColor: textDecorationColor,
            backgroundColor: textbackgroundColor,
          )),
    );
