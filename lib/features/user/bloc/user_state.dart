// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
sealed class UserBaseState {}

final class UserLoadingState extends UserBaseState {}

final class UserFailureState extends UserBaseState {
  final String message;
  UserFailureState({required this.message});
}

class UserState extends UserBaseState {
  final AppUser user;
  UserState({required this.user});
}
