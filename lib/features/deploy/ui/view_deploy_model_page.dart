import 'dart:math';

import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/core/design/components/button.dart';
import 'package:algo_ease/core/design/components/snackbar.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/extension/string_extensions.dart';
import 'package:algo_ease/features/order/bloc/order_bloc.dart';
import 'package:algo_ease/models/deploy.dart';
import 'package:algo_ease/models/strategy_description.dart';
import 'package:algo_ease/models/strategy_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewDeployModelPage extends StatelessWidget {
  const ViewDeployModelPage({
    super.key,
    required this.deployModel,
    required this.strategyDescription,
  });

  final Deploy deployModel;
  final StrategyDescription strategyDescription;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: AppText.headingThreeMedium("Model"),
        ),
        body: BlocListener<OrderBloc, OrderBaseState>(
          bloc: locator.get<OrderBloc>(),
          listener: (context, state) {
            if (state is OrderSuccessActionState) {
              Navigator.pop(context);
              AppSnackBar().show(context, state.success);
            }
            if (state is OrderErrorActionState) {
              Navigator.pop(context);
              AppSnackBar().show(context, state.error, isError: true);
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.bodyTwoSemiBold("Model Name: "),
                    AppText.bodyTwoSemiBold("NLMDL332x12", color: AppColors.successColor),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 24.w),
                  child: Table(
                      border: TableBorder.all(
                        width: 0.5,
                        color: AppColors.subTextColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      columnWidths: const {
                        0: IntrinsicColumnWidth(flex: 1),
                        1: IntrinsicColumnWidth(flex: 1),
                        2: IntrinsicColumnWidth(flex: 2),
                      },
                      children: generateTableRows(
                        strategyResponse: deployModel.strategyResponse,
                        strategyDescription: strategyDescription,
                      )),
                ),
                SizedBox(height: 12.h),
                AppText.bodyTwoMedium("Model Description"),
                SizedBox(height: 12.h),
                AppText.captionTwoRegular(
                  deployModel.modelDescription,
                  textAlign: TextAlign.center,
                  color: AppColors.subTextColor,
                ),
                SizedBox(height: 12.h),
                AppButton.mainButton(
                  onTap: () {
                    locator.get<OrderBloc>().add(OrderAddEvent(deployModel: deployModel));
                  },
                  label: "Deploy Model",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  generateTableRows({
    required StrategyResponse strategyResponse,
    required StrategyDescription strategyDescription,
  }) {
    List<TableRow> rows = [];
    final strategyKeyValuePairs = strategyResponse.toModelDisplay().entries.toList();
    final strategyDescKeyValuePairs = strategyDescription.toMap().entries.toList();
    int rowCount = max(strategyKeyValuePairs.length, strategyDescKeyValuePairs.length);

    for (int i = 0; i < rowCount; i++) {
      rows.add(
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: AppText.captionOneRegular(
                strategyKeyValuePairs[i].key.capitalize(),
                textAlign: TextAlign.center,
                color: AppColors.subTextColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: AppText.captionOneRegular(
                strategyKeyValuePairs[i].value.toString(),
                textAlign: TextAlign.center,
                color: AppColors.subTextColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: AppText.captionTwoRegular(
                strategyDescKeyValuePairs[i].value.toString(),
                textAlign: TextAlign.center,
                color: AppColors.subTextColor,
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }
}
