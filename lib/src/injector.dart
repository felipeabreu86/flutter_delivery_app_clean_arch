import 'package:dio/dio.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/datasources/remote/authentication_datasource.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/datasources/remote/cep_datasource.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/datasources/remote/implementations/authentication_datasource_implementation.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/datasources/remote/implementations/cep_datasource_implementation.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/repositories/authentication_repository_implementation.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/repositories/cep_repository_implementation.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/repositories/authentication_repository.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/repositories/cep_repository.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/cep_search_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/check_auth_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/create_user_with_email_password_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/login_with_email_password_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/send_password_reset_email.dart';
import 'package:flutter_firebase_login_clean_arch/src/domain/usecases/signout_usecase.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/blocs/remote_authentication/remote_authentication_bloc.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/blocs/remote_cep/remote_cep_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Datasources
  injector.registerSingleton<IAuthenticationDatasource>(
    AuthenticationDatasourceImplementation(),
  );
  injector.registerSingleton<ICepDatasource>(
    CepDatasourceImplementation(injector()),
  );

  // Repositories
  injector.registerSingleton<IAuthenticationRepository>(
    AuthenticationRepositoryImpl(injector()),
  );
  injector.registerSingleton<ICepRepository>(
    CepRepositoryImplementation(injector()),
  );

  // Usecases
  injector.registerSingleton<LoginWithEmailAndPasswordUseCase>(
    LoginWithEmailAndPasswordUseCase(injector()),
  );
  injector.registerSingleton<CheckAuthenticationUseCase>(
    CheckAuthenticationUseCase(injector()),
  );
  injector.registerSingleton<CepSearchUseCase>(
    CepSearchUseCase(injector()),
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

  // Blocs
  injector.registerSingleton<RemoteAuthenticationBloc>(
    RemoteAuthenticationBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
    ),
  );
  injector.registerSingleton<RemoteCepBloc>(
    RemoteCepBloc(injector()),
  );
}
