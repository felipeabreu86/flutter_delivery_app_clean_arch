import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/failures.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/no_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/usecases/usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/repositories/authentication_repository.dart';

class SignOutUseCase implements UseCase<bool, NoRequestParams> {
  SignOutUseCase(this._authenticationRepository);

  final IAuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, bool>> call(NoRequestParams noParams) async {
    final result = await _authenticationRepository.signOut();
    return result;
  }
}
