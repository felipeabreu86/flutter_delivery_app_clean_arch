import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/blocs/bloc_with_state.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/no_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/user_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/check_auth_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/create_user_with_email_password_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/login_with_email_password_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/send_password_reset_email.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/signout_usecase.dart';

part 'remote_authentication_event.dart';
part 'remote_authentication_state.dart';

class RemoteAuthenticationBloc extends BlocWithState<RemoteAuthenticationEvent,
    RemoteAuthenticationState> {
  RemoteAuthenticationBloc(
    this._loginWithEmailAndPasswordUseCase,
    this._checkAuthenticationUseCase,
    this._signOutUseCase,
    this._createUserWithEmailAndPasswordUseCase,
    this._sendPasswordResetEmailUsecase,
  ) : super(const AuthenticationInitial()) {
    on<CheckAuthentication>(
      _checkAuthentication,
      transformer: sequential(),
    );
    on<LoginWithEmailAndPassword>(
      _loginWithEmailAndPassword,
      transformer: sequential(),
    );
    on<SignOut>(
      _signOut,
      transformer: sequential(),
    );
    on<CreateUserWithEmailAndPassword>(
      _createUserWithEmailAndPassword,
      transformer: sequential(),
    );
    on<SendPasswordResetEmail>(
      _sendPasswordResetEmail,
      transformer: sequential(),
    );
  }

  /// Usecases

  final LoginWithEmailAndPasswordUseCase _loginWithEmailAndPasswordUseCase;

  final CheckAuthenticationUseCase _checkAuthenticationUseCase;

  final SignOutUseCase _signOutUseCase;

  final CreateUserWithEmailAndPasswordUseCase
      _createUserWithEmailAndPasswordUseCase;

  final SendPasswordResetEmailUsecase _sendPasswordResetEmailUsecase;

  /// Attributes

  AppUser _user = AppUser.empty();
  AppUser get user => _user;

  /// Implementation of Events

  FutureOr<void> _loginWithEmailAndPassword(
    RemoteAuthenticationEvent event,
    Emitter<RemoteAuthenticationState> emit,
  ) async {
    if (event.params != null) {
      await runBlocProcess(() async {
        final response = await _loginWithEmailAndPasswordUseCase(event.params!);
        response.fold(
          (failure) => emit(AuthenticationError(errorMessage: failure.message)),
          (user) => {
            _user = user,
            emit(LoggedIn(_user)),
          },
        );
      });
    }
  }

  FutureOr<void> _checkAuthentication(
    RemoteAuthenticationEvent event,
    Emitter<RemoteAuthenticationState> emit,
  ) async {
    await runBlocProcess(() async {
      final response = await _checkAuthenticationUseCase(NoRequestParams());
      response.fold(
        (failure) => emit(const LoggedOut()),
        (user) => {
          _user = user,
          emit(LoggedIn(_user)),
        },
      );
    });
  }

  FutureOr<void> _signOut(
    RemoteAuthenticationEvent event,
    Emitter<RemoteAuthenticationState> emit,
  ) async {
    await runBlocProcess(() async {
      final response = await _signOutUseCase(NoRequestParams());
      response.fold(
        (failure) => emit(AuthenticationError(errorMessage: failure.message)),
        (success) => {
          _user = AppUser.empty(),
          emit(const LoggedOut()),
        },
      );
    });
  }

  FutureOr<void> _createUserWithEmailAndPassword(
    RemoteAuthenticationEvent event,
    Emitter<RemoteAuthenticationState> emit,
  ) async {
    if (event.params != null) {
      await runBlocProcess(() async {
        final response =
            await _createUserWithEmailAndPasswordUseCase(event.params!);
        response.fold(
          (failure) => emit(AuthenticationError(errorMessage: failure.message)),
          (user) => {
            _user = user,
            emit(LoggedIn(_user)),
          },
        );
      });
    }
  }

  FutureOr<void> _sendPasswordResetEmail(
    RemoteAuthenticationEvent event,
    Emitter<RemoteAuthenticationState> emit,
  ) async {
    if (event.params != null) {
      await runBlocProcess(() async {
        final response = await _sendPasswordResetEmailUsecase(event.params!);
        response.fold(
          (failure) => emit(AuthenticationError(errorMessage: failure.message)),
          (user) => emit(const ResetPasswordSentByEmail()),
        );
      });
    }
  }
}
