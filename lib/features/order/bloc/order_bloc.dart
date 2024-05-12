import 'dart:async';
import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/enums/order_enums.dart';
import 'package:algo_ease/features/order/repo/order_repo.dart';
import 'package:algo_ease/models/deploy.dart';
import 'package:algo_ease/models/order.dart';
import 'package:algo_ease/models/strategy_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderBaseState> {
  OrderBloc() : super(OrderLoadingState()) {
    on<OrderFetchEvent>(orderFetchEvent);
    on<OrderAddEvent>(orderAddEvent);
    on<OrderUpdateEvent>(orderUpdateEvent);
  }

  Future<void> orderFetchEvent(OrderFetchEvent event, Emitter<OrderBaseState> emit) async {
    emit(OrderLoadingState());
    var orders = await locator.get<OrderRepo>().getOrders('123', event.status.toMap()).first ?? [];

    for (var i = 0; i < orders.length; i++) {
      var order = orders[i];
      var currentPrice = await _fetchCurrentStockPrice(order.deployModel.strategyResponse.scrip);

      var status = _getOrderStatus(order.deployModel.strategyResponse, currentPrice);

      // Update the order in the orders list directly
      orders[i] = order.copyWith(status: status, updatedAt: DateTime.now());

      // Update order in the database
      await locator.get<OrderRepo>().updateOrder(orders[i]);
    }

    emit(OrderState(orders: orders));
  }

  FutureOr<void> orderAddEvent(OrderAddEvent event, Emitter<OrderBaseState> emit) async {
    await locator.get<OrderRepo>().addOrder(
          Order(
            id: const Uuid().v1(),
            uid: '123', //TODO: Pass userID later
            deployModel: event.deployModel,
            status: OrderStatus.open,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
    emit(OrderSuccessActionState(success: "Model Deployed Succesfull"));
  }

  FutureOr<void> orderUpdateEvent(OrderUpdateEvent event, Emitter<OrderBaseState> emit) async {
    var updateOrder = event.order.copyWith(updatedAt: DateTime.now());
    await locator.get<OrderRepo>().updateOrder(updateOrder);
  }

  Future<double> _fetchCurrentStockPrice(String stockName) async {
    var stock = await locator.get<OrderRepo>().fetchStockPrice(stockName);
    return stock.price;
  }

  OrderStatus _getOrderStatus(StrategyResponse strategyResponse, double currentPrice) {
    if (currentPrice == strategyResponse.entry) {
      if (DateTime.now().isAfter(strategyResponse.entryTime!)) {
        return OrderStatus.executed;
      } else {
        return OrderStatus.open;
      }
    } else if (currentPrice == strategyResponse.exit) {
      return OrderStatus.closed;
    } else {
      // Check if it's beyond exit time
      if (DateTime.now().isAfter(strategyResponse.exitTime!)) {
        return OrderStatus.closed;
      }

      // Check if the current price has reached the stop-loss or take-profit levels
      if (currentPrice <= strategyResponse.entry - strategyResponse.maxLoss ||
          currentPrice >= strategyResponse.entry + strategyResponse.maxProfit) {
        return OrderStatus.closed;
      }

      // If none of the above conditions are met, the order remains open
      return OrderStatus.open;
    }
  }
}
