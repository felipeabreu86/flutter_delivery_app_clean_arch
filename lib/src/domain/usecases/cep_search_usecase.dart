import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/usecases/usecase_with_params.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/address.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/via_cep_repository.dart';

class CepSearchUseCase
    implements UseCaseWithParams<DataState<Address>, String> {
  CepSearchUseCase(this._viaCepRepository);

  final ViaCepRepository _viaCepRepository;

  @override
  Future<DataState<Address>> call({required String params}) {
    return _viaCepRepository.getAddress(params);
  }
}
