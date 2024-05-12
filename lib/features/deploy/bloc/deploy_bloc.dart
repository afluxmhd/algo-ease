import 'dart:async';

import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/features/deploy/repo/deploy_repo.dart';
import 'package:algo_ease/features/strategy/repo/strategy_repo.dart';
import 'package:algo_ease/models/deploy.dart';
import 'package:algo_ease/models/strategy_description.dart';
import 'package:algo_ease/models/strategy_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'deploy_event.dart';
part 'deploy_state.dart';

class DeployBloc extends Bloc<DeployEvent, DeployBaseState> {
  DeployBloc() : super(DeployLoadingState()) {
    on<LoadDeployEvent>(loadDeployEvent);
    on<DeployViewModelEvent>(deployViewModelEvent);
    on<DeployModelSaveEvent>(deployModelSaveEvent);
  }

  FutureOr<void> loadDeployEvent(LoadDeployEvent event, Emitter<DeployBaseState> emit) async {
    emit(DeployLoadingState());
    List<Deploy>? deployModels = [];
    deployModels = await locator.get<DeployRepo>().getDeployModels('123').first;
    emit(DeployState(deployModels: deployModels ?? []));
  }

  FutureOr<void> deployViewModelEvent(DeployViewModelEvent event, Emitter<DeployBaseState> emit) async {
    try {
      var strategyDescription = await locator.get<StrategyRepo>().getStrategyDescription();
      emit(DeployViewModelActionState(deployModel: event.deployModel, strategyDescription: strategyDescription));
    } catch (e) {
      emit(DeployFailureState(error: e.toString()));
    }
  }

  FutureOr<void> deployModelSaveEvent(DeployModelSaveEvent event, Emitter<DeployBaseState> emit) async {
    var deployModel = Deploy(
        id: const Uuid().v1(),
        uid: '123',
        modelName: "NLPMD123",
        strategyResponse: event.strategyResponse,
        modelDescription:
            "The model serves as a comprehensive blueprint for algorithmic trading strategies, offering clarity and precision in decision-making. By defining crucial parameters such as the action (BUY or SELL), security, quantity, entry price, stop loss, maximum loss, and maximum profit thresholds, the model empowers traders to execute well-defined strategies tailored to their risk tolerance and market outlook. This structured approach enhances efficiency in trade execution, aids in risk management by setting predefined loss limits, and allows for systematic evaluation and optimization of trading performance. Ultimately, the model streamlines the translation of trading ideas into actionable plans, facilitating disciplined and strategic trading in dynamic financial markets.");
    await locator.get<DeployRepo>().addDeployModel(deployModel);
    emit(DeploySuccessActionState(success: "Deploy model has been saved "));
  }
}
