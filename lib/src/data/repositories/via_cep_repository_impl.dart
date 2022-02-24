import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/params/cep_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/via_cep_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/address.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/via_cep_repository.dart';

class ViaCepRepositoryImpl implements ViaCepRepository {
  const ViaCepRepositoryImpl(this._viaCepService);

  final ViaCepService _viaCepService;

  @override
  Future<DataState<Address>> getAddress(CepRequestParams params) async {
    try {
      final httpResponse = await _viaCepService.getAddress(params.cep);

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
