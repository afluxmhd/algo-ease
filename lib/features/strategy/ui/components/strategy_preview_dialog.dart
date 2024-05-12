import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/core/design/components/button.dart';
import 'package:algo_ease/core/design/components/snackbar.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/extension/string_extensions.dart';
import 'package:algo_ease/features/deploy/bloc/deploy_bloc.dart';
import 'package:algo_ease/models/strategy_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StrategyPreviewDialog extends StatelessWidget {
  const StrategyPreviewDialog({super.key, required this.strategyResponse});

  final StrategyResponse strategyResponse;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeployBloc, DeployBaseState>(
      bloc: locator.get<DeployBloc>(),
      listener: (context, state) {
        if (state is DeploySuccessActionState) {
          Navigator.pop(context);
          AppSnackBar().show(context, state.success);
        }

        if (state is DeployErrorActionState) {
          Navigator.pop(context);
          AppSnackBar().show(context, state.error);
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.secondaryColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: AppText.headingThreeMedium("Model")),
              SizedBox(height: 18.h),
              Table(
                columnWidths: const {
                  0: IntrinsicColumnWidth(flex: 2),
                  1: IntrinsicColumnWidth(flex: 3),
                },
                border: TableBorder.all(
                  width: 0.5,
                  color: AppColors.subTextColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                children: generateTableRows(strategyResponse),
              ),
              SizedBox(height: 6.h),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (ctx) => const ViewDeployModelPage(deployModel: ,)));
                  },
                  child: AppText.captionOneRegular(
                    "Expand Model >",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              AppButton.mediumButton(
                width: 120.w,
                onTap: () {
                  locator.get<DeployBloc>().add(DeployModelSaveEvent(strategyResponse: strategyResponse));
                },
                label: "Confirm",
              ),
            ],
          ),
        ),
      ),
    );
  }

  generateTableRows(StrategyResponse strategyResponse) {
    List<TableRow> rows = [];
    final keyValuePairs = strategyResponse.toModelDisplay().entries.toList();

    int rowCount = keyValuePairs.length < 5 ? keyValuePairs.length : 6;

    for (int i = 0; i < rowCount; i++) {
      rows.add(
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: AppText.bodyThreeRegular(
                keyValuePairs[i].key.capitalize(),
                textAlign: TextAlign.center,
                color: AppColors.subTextColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: AppText.bodyThreeRegular(
                keyValuePairs[i].value.toString(),
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
