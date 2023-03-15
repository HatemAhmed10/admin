import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  Function? function;
  Widget? widget;
  Color? backgroundcolor;
  double borderraduis = 30.0;
  double? ButtonHight;
  Function? onLongPressfunction;
  RoundedRectangleBorder? shape;

  CustomButton2({
    super.key,
    required Function function,
    required Widget widget,
    Color? backgroundcolor,
    double borderraduis = 30.0,
    double? ButtonHight,
    Function? onLongPressfunction,
    RoundedRectangleBorder? shape,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      color: backgroundcolor,
      height: ButtonHight,
      shape: shape,
      onPressed: () {
        function!();
      },
      child: widget,
      textColor: Colors.yellow,
      onLongPress: () {
        onLongPressfunction!();
      },
    );
  }
}
