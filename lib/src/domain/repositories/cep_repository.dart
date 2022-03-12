import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/failures.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/cep_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/entities/address.dart';

abstract class ICepRepository {
  Future<Either<Failure, Address>> getAddress(
    CepRequestParams params,
  );
}
