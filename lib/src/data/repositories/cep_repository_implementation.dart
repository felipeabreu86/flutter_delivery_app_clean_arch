import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/exceptions.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/failures.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/cep_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/datasources/remote/cep_datasource.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/entities/address.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/repositories/cep_repository.dart';

class CepRepositoryImplementation implements ICepRepository {
  const CepRepositoryImplementation(this._cepService);

  final ICepDatasource _cepService;

  @override
  Future<Either<Failure, Address>> getAddress(CepRequestParams params) async {
    try {
      final httpResponse = await _cepService.getAddress(params.cep);
      return Right(httpResponse.data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
