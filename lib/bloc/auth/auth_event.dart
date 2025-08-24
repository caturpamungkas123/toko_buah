part of 'auth_bloc.dart';

@immutable
sealed class AuthLoginEvent {}

class OnAuthLogInEvent extends AuthLoginEvent {
  final String username;
  final String password;

  OnAuthLogInEvent({required this.username, required this.password});
}
