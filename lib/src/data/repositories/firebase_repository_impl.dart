import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/firebase_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  const FirebaseRepositoryImpl(this._firebaseService);

  final FirebaseService _firebaseService;

  @override
  Future<DataState<AppUser>> loginWithEmailPassword(
    UserRequestParams params,
  ) async {
    try {
      final response = await _firebaseService.loginWithEmailPassword(
        email: params.email,
        password: params.password,
      );

      if (response.userId.isNotEmpty) {
        return DataSuccess(response);
      } else {
        return const DataFailed(errorMessage: 'Erro no login.');
      }
    } catch (error) {
      return DataFailed(errorMessage: error.toString());
    }
  }

  @override
  Future<DataState<AppUser>> checkAuthentication() async {
    try {
      final response = await _firebaseService.checkAuthentication();

      if (response.userId.isNotEmpty) {
        return DataSuccess(response);
      } else {
        return const DataFailed();
      }
    } catch (error) {
      return DataFailed(errorMessage: error.toString());
    }
  }
}
