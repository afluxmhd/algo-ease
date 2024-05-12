// ignore_for_file: deprecated_member_use

import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBottomBar extends StatelessWidget {
  final TabController tabController;
  final Function(int) onTapped;

  const HomeBottomBar({
    super.key,
    required this.tabController,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              controller: tabController,
              padding: const EdgeInsets.symmetric(vertical: 12),
              indicator: BoxDecoration(border: Border.all(color: Colors.transparent)),
              dividerColor: Colors.transparent,
              tabs: [
                Tab(
                  icon: SvgPicture.asset("assets/icons/home_icon.svg",
                      height: 24, color: tabController.index == 0 ? AppColors.primaryTextColor : AppColors.subTextColor),
                ),
                Tab(
                  icon: SvgPicture.asset("assets/icons/model_icon.svg",
                      height: 24, color: tabController.index == 1 ? AppColors.primaryTextColor : AppColors.subTextColor),
                ),
                Tab(
                  icon: SvgPicture.asset("assets/icons/orders_icon.svg",
                      height: 24, color: tabController.index == 2 ? AppColors.primaryTextColor : AppColors.subTextColor),
                ),
                Tab(
                  icon: SvgPicture.asset("assets/icons/user_icon.svg",
                      height: 24, color: tabController.index == 3 ? AppColors.primaryTextColor : AppColors.subTextColor),
                ),
              ],
              onTap: onTapped,
            ),
          ],
        ),
      ),
    );
  }
}
