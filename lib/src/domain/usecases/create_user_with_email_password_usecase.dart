import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/failures.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/user_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/usecases/usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/repositories/authentication_repository.dart';

class CreateUserWithEmailAndPasswordUseCase
    implements UseCase<AppUser, UserRequestParams> {
  CreateUserWithEmailAndPasswordUseCase(this._authenticationRepository);

  final IAuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, AppUser>> call(UserRequestParams params) async {
    final result =
        await _authenticationRepository.createUserWithEmailAndPassword(params);
    return result;
  }
}
