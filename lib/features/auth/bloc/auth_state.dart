part of 'auth_bloc.dart';

@immutable
sealed class AuthBaseState {}

class AuthActionState extends AuthBaseState {}

class AuthState extends AuthBaseState {
  final bool isLoading;
  AuthState({this.isLoading = false});
}

class AuthLoadingState extends AuthBaseState {}

class AuthFailureState extends AuthBaseState {
  final String message;
  AuthFailureState({required this.message});
}

class AuthErrorActionState extends AuthActionState {
  final String error;
  AuthErrorActionState({required this.error});
}
