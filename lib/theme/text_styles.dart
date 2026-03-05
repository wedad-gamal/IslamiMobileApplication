import 'package:flutter/material.dart';

import 'colors.dart';

abstract class TextStyles {

  static TextStyle bodyLargeStyle({Color color = AppColors.white, double fontSize = 16}){
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: "janna"
    );
  }
  static TextStyle bodyMediumStyle({Color color = AppColors.white, double fontSize = 14, height= 2.5, letterSpacing=0.5}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: "janna",
        height: height, // This adds the vertical "breathing room"
        letterSpacing: letterSpacing,
    );
  }
  static TextStyle bodySmallStyle({Color color = AppColors.white, double fontSize = 12}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: "janna"
    );
  }
  static TextStyle labelLargeStyle({Color color = AppColors.white, double fontSize = 16}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
        fontFamily: "janna"
    );
  }
  static TextStyle labelMediumStyle({Color color = AppColors.white, double fontSize = 14}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
        fontFamily: "janna"
    );
  }
  static TextStyle labelSmallStyle({Color color = AppColors.white, double fontSize = 12}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
        fontFamily: "janna"
    );
  }
  static TextStyle titleLargeStyle({Color color = AppColors.white, double fontSize = 24}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
        fontFamily: "janna"
    );
  }
  static TextStyle titleMediumStyle({Color color = AppColors.white, double fontSize = 20}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
        fontFamily: "janna"
    );
  }
  static TextStyle titleSmallStyle({Color color = AppColors.white, double fontSize = 18}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
        fontFamily: "janna"
    );
  }
}