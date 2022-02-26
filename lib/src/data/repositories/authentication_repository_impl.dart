import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/datasources/remote/authentication_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl(this._authenticationService);

  final AuthenticationService _authenticationService;

  @override
  Future<DataState<AppUser>> loginWithEmailPassword(
    UserRequestParams params,
  ) async {
    final response = await _authenticationService.loginWithEmailPassword(
      email: params.email ?? '',
      password: params.password ?? '',
    );

    if (response.isValid) {
      return DataSuccess(response);
    } else {
      return const DataFailed();
    }
  }

  @override
  Future<DataState<AppUser>> checkAuthentication() async {
    final response = await _authenticationService.checkAuthentication();

    if (response.isValid) {
      return DataSuccess(response);
    } else {
      return const DataFailed();
    }
  }

  @override
  Future<DataState<bool>> signOut() async {
    final response = await _authenticationService.signOut();

    if (response) {
      return DataSuccess(response);
    } else {
      return const DataFailed();
    }
  }

  @override
  Future<DataState<AppUser>> createUserWithEmailAndPassword(
    UserRequestParams params,
  ) async {
    final response =
        await _authenticationService.createUserWithEmailAndPassword(
      email: params.email ?? '',
      password: params.password ?? '',
      fullname: params.fullname ?? '',
    );

    if (response.isValid) {
      return DataSuccess(response);
    } else {
      return const DataFailed();
    }
  }

  @override
  Future<DataState<bool>> sendPasswordResetEmail(
    UserRequestParams params,
  ) async {
    try {
      await _authenticationService.sendPasswordResetEmail(
        email: params.email ?? '',
      );
      return const DataSuccess(true);
    } catch (error) {
      return const DataFailed();
    }
  }
}
