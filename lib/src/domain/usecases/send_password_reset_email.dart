import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/usecases/usecase_with_params.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/firebase_repository.dart';

class SendPasswordResetEmailUsecase
    implements UseCaseWithParams<DataState<bool>, UserRequestParams> {
  SendPasswordResetEmailUsecase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  @override
  Future<DataState<bool>> call({required UserRequestParams params}) {
    return _firebaseRepository.sendPasswordResetEmail(params);
  }
}
