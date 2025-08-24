import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toko_buah/common/auth.common.dart';
import 'package:toko_buah/model/auth/login.auth.model.dart';
import 'package:toko_buah/service/auth/login.auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  AuthLoginBloc() : super(AuthInitial()) {
    on<OnAuthLogInEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final req = AuthLoginRequestModel(
          username: event.username,
          password: event.password,
        );
        final result = await AuthService.login(req);
        if (result!.error == null) {
          emit(AuthLoad(result));
          AuthCommon.setToken(result.token);
        } else {
          emit(AuthFail(result));
        }
      } catch (e) {
        emit(AuthError("Terjadi kesalahan: $e"));
      }
    });
  }
}
