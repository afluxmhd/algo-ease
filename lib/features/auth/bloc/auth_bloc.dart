import 'dart:async';

import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/features/auth/repo/auth_repo.dart';
import 'package:algo_ease/features/auth/ui/login_page.dart';
import 'package:algo_ease/features/auth/ui/splash_page.dart';
import 'package:algo_ease/features/home/ui/home_page.dart';
import 'package:algo_ease/models/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthBaseState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>(loginEvent);
    on<FetchUserEvent>(fetchUserEvent);
    on<RegisterEvent>(registerEvent);
    on<LogoutEvent>(logoutEvent);
  }

  FutureOr<void> fetchUserEvent(FetchUserEvent event, Emitter<AuthBaseState> emit) async {
    emit(AuthLoadingState());
    var user = await locator<AuthRepo>().getCurrentUser();
    if ((!event.context.mounted)) return;
    if (user == null) {
      Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (ctx) => LoginPage()));
    } else {
      Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (ctx) => const HomePage()));
    }
    emit(AuthState());
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthBaseState> emit) async {
    if (event.auth.email.isEmpty || event.auth.password.isEmpty) {
      emit(AuthErrorActionState(error: 'Please enter your credentials'));
      return;
    }
    emit(AuthState(isLoading: true));
    try {
      var res = await locator<AuthRepo>().signIn(event.auth.email, event.auth.password);
      if (res == null) {
        emit(AuthErrorActionState(error: 'User is not available. Register Now'));
        return;
      }
      if ((!event.context.mounted)) return;
      Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (ctx) => const HomePage()));
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
    emit(AuthState(isLoading: false));
  }

  FutureOr<void> logoutEvent(LogoutEvent event, Emitter<AuthBaseState> emit) async {
    try {
      await locator<AuthRepo>().signOut();
      if ((!event.context.mounted)) return;
      Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (ctx) => const SplashPage()));
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }
}

FutureOr<void> registerEvent(RegisterEvent event, Emitter<AuthBaseState> emit) async {
  if (event.auth.email.isEmpty || event.auth.password.isEmpty) {
    emit(AuthErrorActionState(error: 'Please enter your credentials'));
    return;
  }
  emit(AuthState(isLoading: true));
  var res = await locator<AuthRepo>().register(event.auth.email, event.auth.password);
  try {
    if ((!event.context.mounted)) return;
    if (res != null) {
      Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (ctx) => const HomePage()));
    }
  } catch (e) {
    emit(AuthFailureState(message: e.toString()));
  }
  emit(AuthState(isLoading: false));
}
