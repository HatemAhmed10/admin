import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:admin/shared/styles/assets_manager.dart';
import 'package:admin/shared/styles/font_manager.dart';

// to make Container
// 1- to make Box Shadow To make Shadow
BoxShadow defaultBoxShadow({
  // the color of shadow
  required Color colorBoxShadow,
  // the Blur of the Shadow
  required double blurRadiusBoxShadow,
  // Dimensions of Shadow
  required Offset offsetBoxShadow,
  // The space of Shadow
  required double spreadRadiusBoxShadow,
}) =>
    BoxShadow(
      color: colorBoxShadow,
      blurRadius: blurRadiusBoxShadow,
      offset: offsetBoxShadow,
      spreadRadius: spreadRadiusBoxShadow,
    );
// 2-To make Box Decoration
BoxDecoration defaultBoxDecoration({
  // the color of the Box but if not can write this color with color of Container Select one
  Color? colorBoxDecoration,
  // to make border
  Border? borderBoxDecoration,
  // to make Radius Border
  BorderRadius? borderRadiusBoxDecoration,
  // to add image in Background
  DecorationImage? decorationImageBoxDecoration,
  // to make BoxShadow in Up
  required BoxShadow boxShadow,
}) =>
    BoxDecoration(
      color: colorBoxDecoration,
      border: borderBoxDecoration,
      borderRadius: borderRadiusBoxDecoration,
      image: decorationImageBoxDecoration,
      boxShadow: [boxShadow],
    );

// 3- To make Sample Container
Widget defaultContainer({
  // the color of Container and not write with Color of BoxDecoration
  Color? colorContainer,
  // Width of Container
  double? widthContainer,
  // The Height of Container
  double? heightContainer,
  // To make Margin
  EdgeInsets? marginContainer,
  // To make Alignment
  Alignment? alignmentContainer,
  // to make boxDecoration in Up
  BoxDecoration? boxDecoration,
  // and add Widget
  Widget? Widget,
  // TO add Padding To Container
  EdgeInsets? padding,
}) =>
    Container(
      color: colorContainer,
      width: widthContainer, // or 12.3
      height: heightContainer,
      margin: marginContainer,
      alignment: alignmentContainer,
      decoration: boxDecoration,
      padding: padding,
      child: Widget,
    );
//-------------------------------------------------
//____________________________________________________
