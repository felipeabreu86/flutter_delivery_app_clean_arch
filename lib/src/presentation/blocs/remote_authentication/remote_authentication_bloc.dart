import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/bloc/bloc_with_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/check_auth_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/create_user_with_email_password_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/login_with_email_password_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/send_password_reset_email.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/signout_usecase.dart';

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
        final dataState = await _loginWithEmailAndPasswordUseCase(
          params: event.params!,
        );

        if (dataState is DataSuccess) {
          _user = dataState.data!;
          emit(LoggedIn(_user));
        } else if (dataState is DataFailed) {
          emit(
            const AuthenticationError(errorMessage: "Erro ao realizar login."),
          );
        }
      });
    }
  }

  FutureOr<void> _checkAuthentication(
    RemoteAuthenticationEvent event,
    Emitter<RemoteAuthenticationState> emit,
  ) async {
    await runBlocProcess(() async {
      final dataState = await _checkAuthenticationUseCase();

      if (dataState is DataSuccess) {
        _user = dataState.data!;
        emit(LoggedIn(_user));
      } else if (dataState is DataFailed) {
        emit(const LoggedOut());
      }
    });
  }

  FutureOr<void> _signOut(
    RemoteAuthenticationEvent event,
    Emitter<RemoteAuthenticationState> emit,
  ) async {
    await runBlocProcess(() async {
      final dataState = await _signOutUseCase();

      if (dataState is DataSuccess) {
        _user = AppUser.empty();
        emit(const LoggedOut());
      } else if (dataState is DataFailed) {
        emit(
          const AuthenticationError(errorMessage: "Erro ao realizar logout."),
        );
      }
    });
  }

  FutureOr<void> _createUserWithEmailAndPassword(
    RemoteAuthenticationEvent event,
    Emitter<RemoteAuthenticationState> emit,
  ) async {
    if (event.params != null) {
      await runBlocProcess(() async {
        final dataState = await _createUserWithEmailAndPasswordUseCase(
          params: event.params!,
        );

        if (dataState is DataSuccess) {
          _user = dataState.data!;
          emit(LoggedIn(_user));
        } else if (dataState is DataFailed) {
          emit(
            const AuthenticationError(
              errorMessage: "Erro na criação de usuário.",
            ),
          );
        }
      });
    }
  }

  FutureOr<void> _sendPasswordResetEmail(
    RemoteAuthenticationEvent event,
    Emitter<RemoteAuthenticationState> emit,
  ) async {
    if (event.params != null) {
      await runBlocProcess(() async {
        final dataState = await _sendPasswordResetEmailUsecase(
          params: event.params!,
        );

        if (dataState is DataSuccess) {
          emit(const ResetPasswordSentByEmail());
        } else if (dataState is DataFailed) {
          emit(
            const AuthenticationError(
              errorMessage: "Erro ao enviar e-mail de recuperação de senha",
            ),
          );
        }
      });
    }
  }
}
