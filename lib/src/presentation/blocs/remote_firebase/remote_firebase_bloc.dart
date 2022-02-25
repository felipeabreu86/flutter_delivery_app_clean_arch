import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/bloc/bloc_with_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/firebase_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/check_auth_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/create_user_with_email_password_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/login_with_email_password_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/signout_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/injector.dart';

part 'remote_firebase_event.dart';
part 'remote_firebase_state.dart';

class RemoteFirebaseBloc
    extends BlocWithState<RemoteFirebaseEvent, RemoteFirebaseState> {
  RemoteFirebaseBloc(
    this._loginWithEmailAndPasswordUseCase,
    this._checkAuthenticationUseCase,
    this._signOutUseCase,
    this._createUserWithEmailAndPasswordUseCase,
  ) : super(const RemoteFirebaseInitial()) {
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
  }

  /// Usecases

  final LoginWithEmailAndPasswordUseCase _loginWithEmailAndPasswordUseCase;

  final CheckAuthenticationUseCase _checkAuthenticationUseCase;

  final SignOutUseCase _signOutUseCase;

  final CreateUserWithEmailAndPasswordUseCase
      _createUserWithEmailAndPasswordUseCase;

  /// Attributes

  AppUser _user = AppUser.empty();
  AppUser get user => _user;

  /// Implementation of Events

  FutureOr<void> _loginWithEmailAndPassword(
    RemoteFirebaseEvent event,
    Emitter<RemoteFirebaseState> emit,
  ) async {
    if (event.params != null) {
      await runBlocProcess(() async {
        final dataState = await _loginWithEmailAndPasswordUseCase(
          params: event.params!,
        );

        if (dataState is DataSuccess) {
          _user = dataState.data!;
          emit(RemoteFirebaseLoggedIn(_user));
        } else if (dataState is DataFailed) {
          final String errorMessage = injector<FirebaseService>().errorMessage;
          emit(RemoteFirebaseError(errorMessage: errorMessage));
        }
      });
    }
  }

  FutureOr<void> _checkAuthentication(
    RemoteFirebaseEvent event,
    Emitter<RemoteFirebaseState> emit,
  ) async {
    await runBlocProcess(() async {
      final dataState = await _checkAuthenticationUseCase();

      if (dataState is DataSuccess) {
        _user = dataState.data!;
        emit(RemoteFirebaseLoggedIn(_user));
      } else if (dataState is DataFailed) {
        emit(const RemoteFirebaseLoggedOut());
      }
    });
  }

  FutureOr<void> _signOut(
    RemoteFirebaseEvent event,
    Emitter<RemoteFirebaseState> emit,
  ) async {
    await runBlocProcess(() async {
      final dataState = await _signOutUseCase();

      if (dataState is DataSuccess) {
        _user = AppUser.empty();
        emit(const RemoteFirebaseLoggedOut());
      } else if (dataState is DataFailed) {
        final String errorMessage = injector<FirebaseService>().errorMessage;
        emit(RemoteFirebaseError(errorMessage: errorMessage));
      }
    });
  }

  FutureOr<void> _createUserWithEmailAndPassword(
    RemoteFirebaseEvent event,
    Emitter<RemoteFirebaseState> emit,
  ) async {
    if (event.params != null) {
      await runBlocProcess(() async {
        final dataState = await _createUserWithEmailAndPasswordUseCase(
          params: event.params!,
        );

        if (dataState is DataSuccess) {
          _user = dataState.data!;
          emit(RemoteFirebaseLoggedIn(_user));
        } else if (dataState is DataFailed) {
          final String errorMessage = injector<FirebaseService>().errorMessage;
          emit(RemoteFirebaseError(errorMessage: errorMessage));
        }
      });
    }
  }
}
