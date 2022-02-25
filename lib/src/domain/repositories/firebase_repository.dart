import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';

abstract class FirebaseRepository {
  Future<DataState<AppUser>> loginWithEmailPassword(
    UserRequestParams params,
  );
  Future<DataState<AppUser>> createUserWithEmailAndPassword(
    UserRequestParams params,
  );
  Future<DataState<bool>> sendPasswordResetEmail(
    UserRequestParams params,
  );
  Future<DataState<AppUser>> checkAuthentication();
  Future<DataState<bool>> signOut();
}
