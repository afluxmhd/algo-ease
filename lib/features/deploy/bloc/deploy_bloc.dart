import 'dart:async';

import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/features/deploy/repo/deploy_repo.dart';
import 'package:algo_ease/features/strategy/repo/strategy_repo.dart';
import 'package:algo_ease/models/deploy.dart';
import 'package:algo_ease/models/strategy_description.dart';
import 'package:algo_ease/models/strategy_response.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

part 'deploy_event.dart';
part 'deploy_state.dart';

class DeployBloc extends Bloc<DeployEvent, DeployBaseState> {
  DeployBloc() : super(DeployLoadingState()) {
    on<LoadDeployEvent>(loadDeployEvent);
    on<DeployViewModelEvent>(deployViewModelEvent);
    on<DeployModelSaveEvent>(deployModelSaveEvent);
    on<DeployModelRemoveEvent>(deployModelRemoveEvent);
  }

  FutureOr<void> loadDeployEvent(LoadDeployEvent event, Emitter<DeployBaseState> emit) async {
    emit(DeployLoadingState());
    List<Deploy>? deployModels = [];
    deployModels = await locator.get<DeployRepo>().getDeployModels('123').first;
    emit(DeployState(deployModels: deployModels ?? []));
  }

  FutureOr<void> deployViewModelEvent(DeployViewModelEvent event, Emitter<DeployBaseState> emit) async {
    try {
      var currentState = state as DeployState;
      emit(DeployLoadingState());
      var strategyDescription = await locator.get<StrategyRepo>().getStrategyDescription();
      emit(DeployViewModelActionState(deployModel: event.deployModel, strategyDescription: strategyDescription));
      emit(currentState);
    } catch (e) {
      emit(DeployFailureState(error: e.toString()));
    }
  }

  FutureOr<void> deployModelSaveEvent(DeployModelSaveEvent event, Emitter<DeployBaseState> emit) async {
    var deployId = const Uuid().v1();

    var modelDescription = await locator.get<StrategyRepo>().getModelDescription(event.strategyResponse);
    var deployModel = Deploy(
      id: const Uuid().v1(),
      uid: '123',
      modelName: event.strategyResponse.scrip + deployId.substring(0, 4),
      strategyResponse: event.strategyResponse,
      modelDescription: modelDescription.description,
    );
    await locator.get<DeployRepo>().addDeployModel(deployModel);
    emit(DeploySuccessActionState(success: "Deploy model has been saved "));
  }

  FutureOr<void> deployModelRemoveEvent(DeployModelRemoveEvent event, Emitter<DeployBaseState> emit) async {
    await locator.get<DeployRepo>().removeDeployModel(event.id);
    emit(DeploySuccessActionState(success: "Deploy model has been been removed"));
    if (event.context.mounted) {
      Navigator.pop(event.context);
    }
  }
}
