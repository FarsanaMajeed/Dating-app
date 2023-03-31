import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFA5672);
const kTextColor = Color(0xFF1C1C1C);
const kLightTextColor = Color(0xFF363636);
const kAltTextColor = Color(0xFFBBBBBB);
const kAltDarkTextColor = Color(0xFF9D9D9D);
const kInputColor = Color(0xFFF0F0F0);
const kInputTextColor = Color(0xFF646464);
const kINputLabelColor = Color(0xFF5E5E5E);
const kFbColor = Color(0xFF1976D2);
const kGoogleColor = Color(0xFFFF3D00);
const whiteTwo = Color(0xfff5f5f5);

class TextStylez {
  static const textStyle = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w700,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 40.0);
  static const textStyle8 = TextStyle(
      color: Color(0xff21254f),
      fontWeight: FontWeight.w600,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 24.0);
  static const textStyle9 = TextStyle(
      color: kPrimaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 10);
  static const textStyle10 = TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.w400,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 10);
  static const textStyle13 = TextStyle(
      color: Color(0xffff6300),
      fontWeight: FontWeight.w600,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 12.0);

  static const textStyle12 = TextStyle(
      color: Color(0xff333333),
      fontWeight: FontWeight.w500,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 12.0);
  static const textStyle11 = TextStyle(
      color: Color(0xff999999),
      fontWeight: FontWeight.w400,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 12.0);

  static const textStyle5 = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w600,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 16.0);
  static const textStyle15 = TextStyle(
      color: Color(0xffc4c4c4),
      fontWeight: FontWeight.w400,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 32.0);

  static const textStyle14 = TextStyle(
      color: Color(0xFFFA5672),
      fontWeight: FontWeight.w400,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 32.0);
  static const textStyle7 = TextStyle(
      color: Color(0xff21254f),
      fontWeight: FontWeight.w600,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 16.0);
  static const textStyle39 = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 15.0);
  static const textStyle37 = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontFamily: "Urbanist",
      fontStyle: FontStyle.normal,
      fontSize: 18.0);
}

var outLineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    width: 2,
    color: Color(0xff0F0D23).withOpacity(0.4),
  ),
);
Widget buildButton({
  required double height,
  required double width,
  required String title,
  required bool filled,
}) {
  return filled
      ? Container(
          height: height,
          width: width,
          child: Center(
            child: Text(title, style: TextStylez.textStyle5),
          ),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(40)),
        )
      : Container(
          height: height,
          width: width,
          child: Center(
            child: Text(title, style: TextStylez.textStyle7),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(40)),
        );
}
