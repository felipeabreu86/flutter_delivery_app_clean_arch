import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/bloc/bloc_with_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/login_usecase.dart';

part 'remote_firebase_event.dart';
part 'remote_firebase_state.dart';

class RemoteFirebaseBloc
    extends BlocWithState<RemoteFirebaseEvent, RemoteFirebaseState> {
  RemoteFirebaseBloc(this._loginUseCase)
      : super(const RemoteFirebaseInitial()) {
    on<Login>(
      _login,
      transformer: sequential(),
    );
  }

  final LoginUseCase _loginUseCase;

  FutureOr<void> _login(
    RemoteFirebaseEvent event,
    Emitter<RemoteFirebaseState> emit,
  ) async {
    final dataState = await _loginUseCase(
      params: event.params,
    );

    if (dataState is DataSuccess && dataState.data.email.isNotEmpty) {
      emit(RemoteFirebaseDone(dataState.data));
    } else if (dataState is DataFailed) {
      emit(const RemoteFirebaseError());
    }
  }
}
