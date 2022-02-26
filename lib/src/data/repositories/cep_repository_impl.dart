import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/params/cep_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/datasources/remote/cep_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/address.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  const CepRepositoryImpl(this._cepService);

  final CepService _cepService;

  @override
  Future<DataState<Address>> getAddress(CepRequestParams params) async {
    try {
      final httpResponse = await _cepService.getAddress(params.cep);

      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.cep.isNotEmpty) {
        return DataSuccess(httpResponse.data);
      } else {
        return const DataFailed();
      }
    } on DioError catch (e) {
      return DataFailed(error: e);
    }
  }
}
