import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/via_cep_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/address.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/via_cep_repository.dart';

class ViaCepRepositoryImpl implements ViaCepRepository {
  const ViaCepRepositoryImpl(this._viaCepService);

  final ViaCepService _viaCepService;

  @override
  Future<DataState<Address>> getAddress(String cep) async {
    final response = await _viaCepService.getAddress(cep);
    if (response.data.cep.isNotEmpty) {
      return DataSuccess(response.data);
    } else {
      return const DataFailed(errorMessage: 'Erro ao buscar CEP.');
    }
  }
}
