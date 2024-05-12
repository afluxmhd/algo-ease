import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/enums/app_tabs_enums.dart';
import 'package:algo_ease/extension/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTabBar extends StatefulWidget {
  final TabController controller;
  final int currentIndex;
  final Function(OrderTabs) onTapChanged;

  const OrderTabBar({
    super.key,
    required this.controller,
    required this.currentIndex,
    required this.onTapChanged,
  });

  @override
  State<OrderTabBar> createState() => _OrderTabBarState();
}

class _OrderTabBarState extends State<OrderTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.controller,
      indicator: const BoxDecoration(),
      labelPadding: EdgeInsets.zero,
      onTap: (index) {
        widget.onTapChanged.call(OrderTabs.toOrderTabs(index));
      },
      tabs: [
        for (var i = 0; i < OrderTabs.values.length; i++)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: widget.currentIndex == i ? AppColors.buttonColor : AppColors.secondaryColor,
              border: Border.all(color: AppColors.subTextColor),
            ),
            child: AppText.bodyThreeSemiBold(OrderTabs.values[i].toString().split('.').last.capitalize()),
          ),
      ],
    );
  }
}
