import 'package:algo_ease/core/design/components/loader.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar {
  void show(BuildContext context, String message, {bool isError = false, bool isLoader = false}) {
    var snackBar = SnackBar(
      duration: isLoader ? const Duration(days: 365) : const Duration(milliseconds: 2000),
      backgroundColor: isError ? AppColors.errorColor : AppColors.buttonColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.bodyThreeMedium(message.length > 32 ? message.substring(0, 32) : message, color: Colors.white),
          if (isLoader) const AppLoader(size: 20),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
