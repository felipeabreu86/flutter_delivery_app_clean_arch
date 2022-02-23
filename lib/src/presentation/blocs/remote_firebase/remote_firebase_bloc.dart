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
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/login_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/injector.dart';

part 'remote_firebase_event.dart';
part 'remote_firebase_state.dart';

class RemoteFirebaseBloc
    extends BlocWithState<RemoteFirebaseEvent, RemoteFirebaseState> {
  RemoteFirebaseBloc(this._loginUseCase, this._checkAuthenticationUseCase)
      : super(const RemoteFirebaseInitial()) {
    on<Login>(
      _login,
      transformer: sequential(),
    );
    on<CheckAuthentication>(
      _checkAuthentication,
      transformer: sequential(),
    );
  }

  final LoginUseCase _loginUseCase;
  final CheckAuthenticationUseCase _checkAuthenticationUseCase;

  FutureOr<void> _login(
    RemoteFirebaseEvent event,
    Emitter<RemoteFirebaseState> emit,
  ) async {
    if (event.params != null) {
      final dataState = await _loginUseCase(
        params: event.params!,
      );

      if (dataState is DataSuccess && dataState.data!.isValid) {
        emit(RemoteFirebaseLoggedIn(dataState.data!));
      } else if (dataState is DataFailed) {
        final String errorMessage = injector<FirebaseService>().errorMessage;
        emit(RemoteFirebaseError(errorMessage: errorMessage));
      }
    }
  }

  FutureOr<void> _checkAuthentication(
    RemoteFirebaseEvent event,
    Emitter<RemoteFirebaseState> emit,
  ) async {
    final dataState = await _checkAuthenticationUseCase();

    if (dataState is DataSuccess) {
      emit(RemoteFirebaseLoggedIn(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(const RemoteFirebaseLoggedOut());
    }
  }
}
