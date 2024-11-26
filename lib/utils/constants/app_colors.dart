import 'package:ecomik/utils/helpers.dart';
import 'package:flutter/material.dart';

/// This file contains custom colors used throughout the app
class AppColors {
  static const Color primaryColor = Color(0xFF7A63EC);
  static const Color secondaryColor = Color(0xFFF79C39);
  static const Color tertiaryColor = Color(0xFF4BCBF9);
  static const Color successColor = Color(0xFF48E98A);
  static const Color alertColor = Color(0xFFFE4651);
  static const Color darkColor = Color(0xFF292B49);
  static const Color bodyTextColor = Color(0xFF888AA0);
  static const Color lineShapeColor = Color(0xFFEBEDF9);
  static const Color shadeColor1 = Color(0xFFF4F5FA);
  static const Color shadeColor2 = Color(0xFFF7F7FB);

  /// Custom MaterialColor from Helper function
  static final MaterialColor primaryMaterialColor =
      Helper.generateMaterialColor(AppColors.primaryColor);
}
