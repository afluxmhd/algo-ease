// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final BuildContext context;
  final AppUser auth;
  LoginEvent({required this.context, required this.auth});
}

class FetchUserEvent extends AuthEvent {
  final BuildContext context;
  FetchUserEvent({required this.context});
}

class RegisterEvent extends AuthEvent {
  final BuildContext context;
  final AppUser auth;
  RegisterEvent({required this.context, required this.auth});
}

class LogoutEvent extends AuthEvent {
  final BuildContext context;
  LogoutEvent({required this.context});
}
