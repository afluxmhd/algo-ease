// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'strategy_bloc.dart';

@immutable
sealed class StrategyBaseState {}

class StrategyActionState extends StrategyBaseState {}

class StrategyLoadingState extends StrategyBaseState {}

class StrategyFailureState extends StrategyBaseState {
  final String message;
  StrategyFailureState({required this.message});
}

final class StrategyState extends StrategyBaseState {
  final List<Suggestion> suggestions;
  final bool isLoading;

  StrategyState({required this.suggestions, this.isLoading = false});

  StrategyState copyWith({
    List<Suggestion>? suggestions,
    bool? isLoading,
  }) {
    return StrategyState(
      suggestions: suggestions ?? this.suggestions,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class StrategyPreviewActionState extends StrategyActionState {
  final StrategyResponse strategyResponse;
  StrategyPreviewActionState({required this.strategyResponse});
}

class StrategyErrorActionState extends StrategyActionState {
  final String error;
  StrategyErrorActionState({required this.error});
}
