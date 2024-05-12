// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'deploy_bloc.dart';

@immutable
sealed class DeployEvent {}

class LoadDeployEvent extends DeployEvent {}

class DeployViewModelEvent extends DeployEvent {
  final Deploy deployModel;
  DeployViewModelEvent({required this.deployModel});
}

class DeployModelTradeEvent extends DeployEvent {}

class DeployModelSaveEvent extends DeployEvent {
  final StrategyResponse strategyResponse;
  DeployModelSaveEvent({required this.strategyResponse});
}
