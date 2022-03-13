import 'package:flutter_firebase_login_clean_arch/src/data/datasources/remote/authentication_datasource.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/datasources/remote/implementations/authentication_datasource_implementation.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/repositories/authentication_repository_implementation.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/repositories/authentication_repository.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/check_auth_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/create_user_with_email_password_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/login_with_email_password_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/send_password_reset_email.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/signout_usecase.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Datasources
  injector.registerSingleton<IAuthenticationDatasource>(
    AuthenticationDatasourceImplementation(),
  );

  // Repositories
  injector.registerSingleton<IAuthenticationRepository>(
    AuthenticationRepositoryImpl(injector()),
  );

  // Usecases
  injector.registerSingleton<LoginWithEmailAndPasswordUseCase>(
    LoginWithEmailAndPasswordUseCase(injector()),
  );
  injector.registerSingleton<CheckAuthenticationUseCase>(
    CheckAuthenticationUseCase(injector()),
  );
  injector.registerSingleton<SignOutUseCase>(
    SignOutUseCase(injector()),
  );
  injector.registerSingleton<CreateUserWithEmailAndPasswordUseCase>(
    CreateUserWithEmailAndPasswordUseCase(injector()),
  );
  injector.registerSingleton<SendPasswordResetEmailUsecase>(
    SendPasswordResetEmailUsecase(injector()),
  );
}
