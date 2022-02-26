import 'package:flutter_delivery_app_clean_arch/src/core/params/cep_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/usecases/usecase_with_params.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/address.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/cep_repository.dart';

class CepSearchUseCase
    implements UseCaseWithParams<DataState<Address>, CepRequestParams> {
  CepSearchUseCase(this._viaCepRepository);

  final CepRepository _viaCepRepository;

  @override
  Future<DataState<Address>> call({required CepRequestParams params}) {
    return _viaCepRepository.getAddress(params);
  }
}
