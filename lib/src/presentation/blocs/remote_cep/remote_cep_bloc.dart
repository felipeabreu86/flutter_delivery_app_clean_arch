import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/bloc/bloc_with_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/params/cep_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/address.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/cep_search_usecase.dart';

part 'remote_cep_event.dart';
part 'remote_cep_state.dart';

class RemoteCepBloc extends BlocWithState<RemoteCepEvent, RemoteCepState> {
  RemoteCepBloc(this._cepSearchUseCase) : super(const RemoteCepInitial()) {
    on<CepSearch>(
      _cepSearch,
      transformer: sequential(),
    );
  }

  final CepSearchUseCase _cepSearchUseCase;

  FutureOr<void> _cepSearch(
    RemoteCepEvent event,
    Emitter<RemoteCepState> emit,
  ) async {
    if (event.params != null) {
      await runBlocProcess(() async {
        final dataState = await _cepSearchUseCase(
          params: event.params!,
        );

        if (dataState is DataSuccess) {
          emit(RemoteCepDone(dataState.data!));
        } else if (dataState is DataFailed) {
          emit(const RemoteCepError());
        }
      });
    }
  }
}
