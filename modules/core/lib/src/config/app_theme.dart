import 'package:core/core.dart';
import 'package:flutter/material.dart';

ThemeData AppTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.softWhite,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primaryColor,
      onPrimary: AppColor.onPrimaryColor,
      secondary: AppColor.secondaryColor,
      onSecondary: AppColor.onSecondaryColor,
      error: AppColor.primaryColor,
      onError: AppColor.primaryColor,
      surface: AppColor.backgroundColor,
      onSurface: AppColor.onBackgroundColor,
    ),
    fontFamily: AppConfig.fontFamily,
  );
}
