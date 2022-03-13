import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/failures.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/user_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/usecases/usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/repositories/authentication_repository.dart';

class SendPasswordResetEmailUsecase
    implements UseCase<bool, UserRequestParams> {
  SendPasswordResetEmailUsecase(this._authenticationRepository);

  final IAuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, bool>> call(UserRequestParams params) async {
    final result =
        await _authenticationRepository.sendPasswordResetEmail(params);
    return result;
  }
}
