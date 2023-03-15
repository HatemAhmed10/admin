// ignore: non_constant_identifier_names
import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomButton({
  required Function function,
  required Widget widget,
  Color? backgroundcolor,
  double borderraduis = 30.0,
  double? ButtonHight,
  Function? onLongPressfunction,
  RoundedRectangleBorder? shape,
  EdgeInsets? edgeInsets =
      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
}) =>
    MaterialButton(
      padding: edgeInsets,
      color: backgroundcolor,
      height: ButtonHight,
      shape: shape,
      onPressed: () {
        function();
      },
      child: widget,
      textColor: Colors.yellow,
      onLongPress: () {
        onLongPressfunction!();
      },
    );

Widget CustomAnimatedButton({
  required Function function,
  required Widget widget,
  Color backgroundcolor = Colors.blue,
  double borderraduis = 30.0,
  double? ButtonHight = 50.0,
  double? Buttonwidth = 50.0,
  Function? onLongPressfunction,
  BoxShape? shape = BoxShape.circle,
}) =>
    AnimatedButton(
      color: backgroundcolor,
      onPressed: () {
        function();
      },
      height: ButtonHight!,
      child: widget,
      shape: shape!,
      shadowDegree: ShadowDegree.dark,
      duration: 70,
      enabled: true,
      width: Buttonwidth!,
    );
