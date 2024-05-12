import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/enums/order_enums.dart';
import 'package:algo_ease/enums/strategy_enums.dart';
import 'package:algo_ease/models/order.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderList extends StatefulWidget {
  const OrderList({
    super.key,
    required this.orders,
  });

  final List<Order> orders;

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: widget.orders.length,
      itemBuilder: (ctx, index) {
        return _buildOrderItem(widget.orders[index]);
      },
    ));
  }

  _buildOrderItem(Order order) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionName(order.deployModel.strategyResponse.action),
              _buildOrderStatus(order.status),
            ],
          ),
          SizedBox(height: 6.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.bodyTwoSemiBold(
                order.deployModel.strategyResponse.scrip.toUpperCase(),
              ),
              AppText.bodyOneSemiBold('₹${order.deployModel.strategyResponse.entry}', color: AppColors.secondaryTextColor),
            ],
          ),
          SizedBox(height: 6.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.bodyThreeRegular("IRB-infrastructure Developers Ltd", color: AppColors.subTextColor),
              AppText.bodyThreeMedium("LTP: \$120.43", color: AppColors.secondaryTextColor),
            ],
          )
        ],
      ),
    );
  }

  _buildOrderStatus(OrderStatus status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: status.getOrderBgColor(),
          border: status == OrderStatus.open
              ? Border.all(
                  color: AppColors.subTextColor,
                  width: 0.5.sp,
                )
              : null),
      child: AppText.captionOneRegular(status.convertToOrder(),
          color: status == OrderStatus.closed ? AppColors.blackColor : AppColors.primaryTextColor),
    );
  }

  _buildActionName(ModelAction action) {
    return AppText.bodyTwoSemiBold(
      action.name.toUpperCase(),
      color: action == ModelAction.buy ? AppColors.successColor : AppColors.errorColor,
    );
  }
}
