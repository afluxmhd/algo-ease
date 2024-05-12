import 'dart:async';
import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/features/strategy/repo/strategy_repo.dart';
import 'package:algo_ease/models/strategy_request.dart';
import 'package:algo_ease/models/strategy_response.dart';
import 'package:algo_ease/models/suggestion.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'strategy_event.dart';
part 'strategy_state.dart';

class StrategyBloc extends Bloc<StrategyEvent, StrategyBaseState> {
  StrategyBloc() : super(StrategyLoadingState()) {
    on<LoadStrategyBuilderEvent>(loadStrategyBuilderEvent);
    on<ProcessStrategyEvent>(processStrategyEvent);
  }

  FutureOr<void> loadStrategyBuilderEvent(LoadStrategyBuilderEvent event, Emitter<StrategyBaseState> emit) async {
    var suggestions = await locator.get<StrategyRepo>().getSuggestions().first;
    emit(StrategyState(suggestions: suggestions ?? []));
  }

  FutureOr<void> processStrategyEvent(ProcessStrategyEvent event, Emitter<StrategyBaseState> emit) async {
    try {
      if (event.strategy.isEmpty) {
        emit(StrategyErrorActionState(error: "Strategy input is Empty"));
        return;
      }

      var currentState = state as StrategyState;
      emit(currentState.copyWith(isLoading: true));

      var deployModel = await locator.get<StrategyRepo>().processStrategy(StrategyRequest(strategy: event.strategy));

      emit(currentState.copyWith(isLoading: false));
      emit(StrategyPreviewActionState(strategyResponse: deployModel));
      emit(currentState);
    } catch (e) {
      emit(StrategyFailureState(message: e.toString()));
    }
  }
}
