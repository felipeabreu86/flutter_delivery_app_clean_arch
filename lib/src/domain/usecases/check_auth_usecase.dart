import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/usecases/usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/app_user.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/firebase_repository.dart';

class CheckAuthenticationUseCase implements UseCase<DataState<AppUser>> {
  CheckAuthenticationUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  @override
  Future<DataState<AppUser>> call() {
    return _firebaseRepository.checkAuthentication();
  }
}
