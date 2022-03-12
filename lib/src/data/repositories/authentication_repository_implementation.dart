import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/exceptions.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/errors/failures.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/user_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/datasources/remote/authentication_datasource.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  const AuthenticationRepositoryImpl(this._authenticationService);

  final IAuthenticationDatasource _authenticationService;

  @override
  Future<Either<Failure, AppUser>> loginWithEmailPassword(
    UserRequestParams params,
  ) async {
    try {
      final user = await _authenticationService.loginWithEmailPassword(
        email: params.email ?? '',
        password: params.password ?? '',
      );
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser>> checkAuthentication() async {
    try {
      final user = await _authenticationService.checkAuthentication();
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      final user = await _authenticationService.signOut();
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser>> createUserWithEmailAndPassword(
    UserRequestParams params,
  ) async {
    try {
      final user = await _authenticationService.createUserWithEmailAndPassword(
        email: params.email ?? '',
        password: params.password ?? '',
        fullname: params.fullname ?? '',
      );
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> sendPasswordResetEmail(
    UserRequestParams params,
  ) async {
    try {
      await _authenticationService.sendPasswordResetEmail(
        email: params.email ?? '',
      );
      return const Right(true);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
