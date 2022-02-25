import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/usecases/usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/authentication_repository.dart';

class SignOutUseCase implements UseCase<DataState<bool>> {
  SignOutUseCase(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<DataState<bool>> call() {
    return _authenticationRepository.signOut();
  }
}
