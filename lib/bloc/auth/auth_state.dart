part of 'auth_bloc.dart';

@immutable
sealed class AuthLoginState {}

final class AuthInitial extends AuthLoginState {}

final class AuthLoad extends AuthLoginState {
  final AuthLoginResponseModel token;
  AuthLoad(this.token);
}

final class AuthLoading extends AuthLoginState {}

final class AuthFail extends AuthLoginState {
  final AuthLoginResponseModel errors;
  AuthFail(this.errors);
}

final class AuthError extends AuthLoginState {
  final String errors;
  AuthError(this.errors);
}
