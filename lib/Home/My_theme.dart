import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryLightColor=Color(0xff39A552);
  static Color WhiteColor=Color(0xffffffff);
  static Color BlackColor=Color(0xff303030);
  static Color redColor=Color(0xffc91c22);
  static Color darkBlueColor=Color(0xff003e90);
  static Color pinkColor=Color(0xffED1E79);
  static Color brownColor=Color(0xffCF7E48);
  static Color blueColor=Color(0xff4882CF);
  static Color yellowColor=Color(0xff39A552);
  static Color greyColor=Color(0xff4F5A69);




  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primaryLightColor
    ),
      textTheme: TextTheme(
  headline1: TextStyle(
  color: WhiteColor,
      fontSize: 22,
      fontWeight: FontWeight.bold
  ),
  headline2: TextStyle(
  color: BlackColor,
  fontSize: 22,
  fontWeight: FontWeight.bold
  )
      )
  );
}