import 'package:flutter_delivery_app_clean_arch/src/core/params/user_request.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/usecases/usecase_with_params.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/authentication_repository.dart';

class LoginWithEmailAndPasswordUseCase
    implements UseCaseWithParams<DataState<AppUser>, UserRequestParams> {
  LoginWithEmailAndPasswordUseCase(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<DataState<AppUser>> call({required UserRequestParams params}) {
    return _authenticationRepository.loginWithEmailPassword(params);
  }
}
