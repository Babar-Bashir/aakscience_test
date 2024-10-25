import 'dart:async';
import 'package:aak_tele_science/core/entities/user.dart';
import 'package:aak_tele_science/core/entities/user_type_enum.dart';
import 'package:aak_tele_science/features/auth/domain/usecases/user_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/user_signup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<SignUpEvent>(_onAuthSignUp);
    on<SignInEvent>(_onAuthSignIn);
  }

  FutureOr<void> _onAuthSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    print("inside AuthBloc On SignInEvent");
    final res = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(
        AuthSuccess(user),
      ),
    );
  }

  FutureOr<void> _onAuthSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    print("inside AuthBloc On SignUpEvent");
    final res = await _userSignUp(
      UserSignUpParams(
        firstName: event.firstName,
        lastName: event.lastName,
        userType: event.userType,
        userName: event.userName,
        email: event.email,
        password: event.password,
        country: event.country,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(
        AuthSuccess(user),
      ),
    );
  }
}
