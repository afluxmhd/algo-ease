import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.dark,
      useMaterial3: false,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      useMaterial3: false,
    );
  }

  void getAppStatusBarColor(String theme) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: theme == "light" ? Brightness.dark : Brightness.light,
    ));
  }
}
