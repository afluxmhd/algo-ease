import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/core/design/components/button.dart';
import 'package:algo_ease/core/design/components/failure.dart';
import 'package:algo_ease/core/design/components/loader.dart';
import 'package:algo_ease/core/design/components/snackbar.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/features/strategy/bloc/strategy_bloc.dart';
import 'package:algo_ease/features/strategy/ui/components/strategy_input_field.dart';
import 'package:algo_ease/features/strategy/ui/components/strategy_preview_dialog.dart';
import 'package:algo_ease/features/strategy/ui/components/suggestion_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StrategyBuilderPage extends StatelessWidget {
  StrategyBuilderPage({super.key});

  final TextEditingController strategyTextEditingController = TextEditingController();

  final bloc = locator<StrategyBloc>()..add(LoadStrategyBuilderEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: BlocConsumer<StrategyBloc, StrategyBaseState>(
            bloc: bloc,
            listenWhen: (previous, current) => current is StrategyActionState,
            buildWhen: (previous, current) => current is! StrategyActionState,
            listener: (context, state) {
              if (state is StrategyPreviewActionState) {
                showDialog(
                  context: context,
                  builder: (ctx) => StrategyPreviewDialog(
                    strategyResponse: state.strategyResponse,
                  ),
                );
              } else if (state is StrategyErrorActionState) {
                AppSnackBar().show(context, state.error, isError: true);
              }
            },
            builder: (context, state) {
              if (state is StrategyState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 72.h),
                    Align(
                      alignment: Alignment.center,
                      child: AppText.bodyOneMedium(
                        "Process with advanced\nNLP-Technology for trading \nstrategies",
                        color: AppColors.primaryTextColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    StrategyInputField(
                      strategyTextEditingController: strategyTextEditingController,
                    ),
                    AppButton.mediumButton(
                      width: 120.w,
                      onTap: () {
                        bloc.add(ProcessStrategyEvent(context: context, strategy: strategyTextEditingController.text.trim()));
                      },
                      label: "Process",
                      isLoading: state.isLoading,
                    ),
                    SizedBox(height: 22.h),
                    AppText.bodyThreeMedium("Suggestions"),
                    SizedBox(height: 16.h),
                    SuggestionCards(
                      onTap: (strategy) {
                        strategyTextEditingController.text = strategy.strategy;
                      },
                      suggestions: state.suggestions,
                    )
                  ],
                );
              }
              if (state is StrategyLoadingState) {
                return const AppLoader(size: 38);
              }

              if (state is StrategyFailureState) {
                return AppFailure(
                    message: state.message,
                    onRetry: () {
                      locator<StrategyBloc>().add(LoadStrategyBuilderEvent());
                    });
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
