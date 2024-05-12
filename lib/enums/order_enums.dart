import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter/material.dart';

enum OrderStatus {
  open,
  executed,
  closed;

  String toMap() {
    switch (this) {
      case OrderStatus.open:
        return 'OPEN';

      case OrderStatus.executed:
        return 'EXECUTED';

      case OrderStatus.closed:
        return 'CLOSED';
    }
  }

  String convertToOrder() {
    switch (this) {
      case OrderStatus.open:
        return 'Pending';

      case OrderStatus.executed:
        return 'Executed';

      case OrderStatus.closed:
        return 'Closed';
    }
  }

  static OrderStatus fromMap(String status) {
    switch (status) {
      case 'OPEN':
        return OrderStatus.open;

      case 'EXECUTED':
        return OrderStatus.executed;

      case 'CLOSED':
        return OrderStatus.closed;

      default:
        throw ArgumentError('Invalid action string: $status');
    }
  }

  Color getOrderBgColor() {
    switch (this) {
      case OrderStatus.open:
        return Colors.transparent;

      case OrderStatus.executed:
        return AppColors.buttonColor;

      case OrderStatus.closed:
        return AppColors.successColor;
    }
  }
}
