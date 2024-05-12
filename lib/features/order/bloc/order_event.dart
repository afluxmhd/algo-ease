part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class OrderFetchEvent extends OrderEvent {
  final OrderStatus status;
  OrderFetchEvent({required this.status});
}

class OrderAddEvent extends OrderEvent {
  final Deploy deployModel;
  OrderAddEvent({required this.deployModel});
}

class OrderUpdateEvent extends OrderEvent {
  final Order order;
  OrderUpdateEvent({required this.order});
}

class OrderTabSwitchEvent extends OrderEvent {
  final OrderStatus status;
  OrderTabSwitchEvent({required this.status});
}
