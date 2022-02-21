import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';

abstract class FirebaseRepository {
  // Firebase Methods
  Future<DataState<AppUser>> login(
    UserRequestParams params,
  );
}
