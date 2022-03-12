import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/failures.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/user_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/entities/app_user.dart';

abstract class IAuthenticationRepository {
  Future<Either<Failure, AppUser>> loginWithEmailPassword(
    UserRequestParams params,
  );

  Future<Either<Failure, AppUser>> createUserWithEmailAndPassword(
    UserRequestParams params,
  );

  Future<Either<Failure, bool>> sendPasswordResetEmail(
    UserRequestParams params,
  );

  Future<Either<Failure, AppUser>> checkAuthentication();

  Future<Either<Failure, bool>> signOut();
}
