import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.size = 50, this.color = AppColors.buttonColor});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.w,
        height: size.h,
        child: CircularProgressIndicator(strokeWidth: 2, color: color),
      ),
    );
  }
}
