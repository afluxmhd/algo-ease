import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/core/design/components/empty_states.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/enums/strategy_enums.dart';
import 'package:algo_ease/features/deploy/bloc/deploy_bloc.dart';
import 'package:algo_ease/features/deploy/ui/view_deploy_model_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class DeployPage extends StatelessWidget {
  DeployPage({super.key});

  final bloc = locator<DeployBloc>()..add(LoadDeployEvent());

  String getDeploySubtle(ModelAction action) {
    var bearish = "The bearish outlook in trading suggests a pessimistic view on the future performance of an asset";
    var bullish = "The bullish prompt in trading indicates an expectation for the price of an asset to rise";
    return action == ModelAction.buy ? bullish : bearish;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: AppText.headingThreeMedium("Deploy"),
        ),
        body: BlocConsumer<DeployBloc, DeployBaseState>(
          bloc: bloc,
          listenWhen: (previous, current) => current is DeployActionState,
          buildWhen: (previous, current) => current is! DeployActionState,
          listener: (context, state) {
            if (state is DeployViewModelActionState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ViewDeployModelPage(
                      deployModel: state.deployModel,
                      strategyDescription: state.strategyDescription,
                    ),
                  ));
            }
          },
          builder: (context, state) {
            if (state is DeployState) {
              if (state.deployModels.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: state.deployModels.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              locator<DeployBloc>().add(DeployViewModelEvent(deployModel: state.deployModels[index]));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset("assets/icons/home_icon.svg"),
                                  const SizedBox(height: 8),
                                  AppText.bodyThreeMedium(state.deployModels[index].modelName),
                                  const SizedBox(height: 6),
                                  AppText.captionTwoRegular(
                                    getDeploySubtle(state.deployModels[index].strategyResponse.action),
                                    textAlign: TextAlign.center,
                                    color: AppColors.subTextColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const AppEmptyState(
                  message: "No deploy model found.",
                  subMessage: "Create one using your favorite strategy \nin the Strategy Builder.",
                  svgPath: "assets/images/empty_deploy_img.svg",
                );
              }
            }

            if (state is DeployLoadingState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) => Shimmer.fromColors(
                          baseColor: AppColors.secondaryColor,
                          highlightColor: AppColors.primaryColor,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is DeployFailureState) {
              return const SizedBox();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
