import 'dart:async';

import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/features/auth/bloc/auth_bloc.dart';
import 'package:algo_ease/features/auth/repo/auth_repo.dart';
import 'package:algo_ease/models/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserBaseState> {
  UserBloc() : super(UserLoadingState()) {
    on<FetchAppUserEvent>(fetchAppUserEvent);
  }

  FutureOr<void> fetchAppUserEvent(FetchAppUserEvent event, Emitter<UserBaseState> emit) async {
    try {
      var user = await locator.get<AuthRepo>().getCurrentUser();
      if (user != null) {
        emit(UserState(user: AppUser(email: user.email!, password: user.email!)));
      }
    } catch (e) {
      emit(UserFailureState(message: e.toString()));
    }
  }
}
