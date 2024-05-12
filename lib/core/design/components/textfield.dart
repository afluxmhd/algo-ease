import 'package:algo_ease/core/design/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, top: 8.h),
      child: TextField(
        controller: controller,
        style: body3RegularStyle,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          hintText: hintText,
          hintStyle: body3RegularStyle,
        ),
      ),
    );
  }
}
