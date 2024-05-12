import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/core/design/components/empty_states.dart';
import 'package:algo_ease/core/design/components/loader.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/enums/app_tabs_enums.dart';
import 'package:algo_ease/enums/order_enums.dart';

import 'package:algo_ease/features/order/bloc/order_bloc.dart';
import 'package:algo_ease/features/order/ui/components/order_list.dart';
import 'package:algo_ease/features/order/ui/components/order_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin, WidgetsBindingObserver {
  int currentIndex = 0;
  late TabController _ordersTabController;

  void setupTabController() {
    _ordersTabController = TabController(
      length: OrderTabs.values.length,
      vsync: this,
      initialIndex: currentIndex,
    );

    _ordersTabController.addListener(() {
      setState(() {
        currentIndex = _ordersTabController.index;
      });
    });
  }

  @override
  void initState() {
    setupTabController();
    locator.get<OrderBloc>().add(OrderFetchEvent(status: OrderStatus.open));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: AppText.headingThreeMedium("Order"),
        ),
        body: Column(
          children: [
            OrderTabBar(
              controller: _ordersTabController,
              currentIndex: currentIndex,
              onTapChanged: (selectedTab) {
                locator.get<OrderBloc>().add(OrderFetchEvent(status: selectedTab.toOrderStatus()));
              },
            ),
            Expanded(
              child: BlocConsumer<OrderBloc, OrderBaseState>(
                bloc: locator.get<OrderBloc>(),
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is OrderLoadingState) {
                    return const AppLoader();
                  }
                  if (state is OrderState) {
                    if (state.orders.isEmpty) {
                      return const AppEmptyState(
                        message: "No Orders found",
                        subMessage: "Start deploying from your saved models \nin the Deploy",
                        svgPath: "assets/images/empty_orders_img.svg",
                      );
                    } else {
                      var orders = state.orders;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [OrderList(orders: orders)],
                        ),
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
