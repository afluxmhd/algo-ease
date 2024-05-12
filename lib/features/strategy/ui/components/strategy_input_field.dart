import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/core/design/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StrategyInputField extends StatelessWidget {
  const StrategyInputField({
    super.key,
    required this.strategyTextEditingController,
  });

  final TextEditingController strategyTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(color: AppColors.secondaryColor, borderRadius: BorderRadius.circular(6.r)),
      child: TextField(
        controller: strategyTextEditingController,
        maxLines: 6,
        style: body3RegularStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Start writing strategy here....",
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          labelStyle: body1MediumStyle,
        ),
      ),
    );
  }
}
