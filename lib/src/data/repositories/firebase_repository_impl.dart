import 'package:dio/dio.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/firebase_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  const FirebaseRepositoryImpl(this._firebaseService);

  final FirebaseService _firebaseService;

  @override
  Future<DataState<AppUser>> login(UserRequestParams params) async {
    try {
      final response = await _firebaseService.login(
        email: params.email,
        password: params.password,
      );
      if (response.fullName.isNotEmpty) {
        return DataSuccess(response);
      } else {
        return DataFailed(response);
      }
    } on DioError catch (e) {
      return DataFailed(AppUser.empty(), error: e);
    } catch (error) {
      return DataFailed(AppUser.empty());
    }
  }
}
