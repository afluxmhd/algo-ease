part of 'deploy_bloc.dart';

@immutable
sealed class DeployBaseState {}

class DeployActionState extends DeployBaseState {}

class DeployLoadingState extends DeployBaseState {}

class DeployFailureState extends DeployBaseState {
  final String error;
  DeployFailureState({required this.error});
}

class DeployState extends DeployBaseState {
  final List<Deploy> deployModels;
  DeployState({required this.deployModels});
}

class DeployViewModelActionState extends DeployActionState {
  final Deploy deployModel;
  final StrategyDescription strategyDescription;
  DeployViewModelActionState({required this.deployModel, required this.strategyDescription});
}

class DeployErrorActionState extends DeployActionState {
  final String error;
  DeployErrorActionState({required this.error});
}

class DeploySuccessActionState extends DeployActionState {
  final String success;
  DeploySuccessActionState({required this.success});
}
