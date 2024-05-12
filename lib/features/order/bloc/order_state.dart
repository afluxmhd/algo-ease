part of 'order_bloc.dart';

@immutable
sealed class OrderBaseState {}

class OrderActionState extends OrderBaseState {}

class OrderLoadingState extends OrderBaseState {}

class OrderFailureState extends OrderBaseState {
  final String error;
  OrderFailureState({required this.error});
}

class OrderState extends OrderBaseState {
  final List<Order> orders;
  OrderState({required this.orders});
}

class OrderErrorActionState extends OrderActionState {
  final String error;
  OrderErrorActionState({required this.error});
}

class OrderSuccessActionState extends OrderActionState {
  final String success;
  OrderSuccessActionState({required this.success});
}
