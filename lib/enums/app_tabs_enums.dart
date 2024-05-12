import 'package:algo_ease/enums/order_enums.dart';

enum HomeTabs { dashboard, members, transactions, reports }

enum OrderTabs {
  open,
  executed,
  closed;

  OrderStatus toOrderStatus() {
    switch (this) {
      case OrderTabs.open:
        return OrderStatus.open;

      case OrderTabs.executed:
        return OrderStatus.executed;

      case OrderTabs.closed:
        return OrderStatus.closed;
    }
  }

  static OrderTabs toOrderTabs(int index) {
    switch (index) {
      case 0:
        return OrderTabs.open;

      case 1:
        return OrderTabs.executed;

      case 2:
        return OrderTabs.closed;

      default:
        throw Exception();
    }
  }
}
