import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/usecases/usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/authentication_repository.dart';

class CheckAuthenticationUseCase implements UseCase<DataState<AppUser>> {
  CheckAuthenticationUseCase(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<DataState<AppUser>> call() {
    return _authenticationRepository.checkAuthentication();
  }
}
