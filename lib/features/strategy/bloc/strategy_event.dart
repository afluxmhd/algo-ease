// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'strategy_bloc.dart';

@immutable
sealed class StrategyEvent {}

class LoadStrategyBuilderEvent extends StrategyEvent {}

class ProcessStrategyEvent extends StrategyEvent {
  final BuildContext context;
  final String strategy;
  ProcessStrategyEvent({required this.context, required this.strategy});
}

class SubmitStrategyEvent extends StrategyEvent {}
