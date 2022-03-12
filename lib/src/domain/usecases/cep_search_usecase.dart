import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/failures.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/cep_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/usecases/usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/entities/address.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/repositories/cep_repository.dart';

class CepSearchUseCase implements UseCase<Address, CepRequestParams> {
  CepSearchUseCase(this._viaCepRepository);

  final ICepRepository _viaCepRepository;

  @override
  Future<Either<Failure, Address>> call(CepRequestParams params) {
    return _viaCepRepository.getAddress(params);
  }
}
