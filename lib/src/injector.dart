import 'package:dio/dio.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/firebase_authentication_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/viacep_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/repositories/cep_repository_impl.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/datasources/remote/authentication_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/datasources/remote/cep_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/authentication_repository.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/cep_repository.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/cep_search_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/check_auth_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/create_user_with_email_password_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/login_with_email_password_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/send_password_reset_email.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/signout_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/blocs/remote_authentication/remote_authentication_bloc.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/blocs/remote_cep/remote_cep_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Datasources
  injector.registerSingleton<AuthenticationService>(
    FirebaseAuthenticationService(),
  );
  injector.registerSingleton<CepService>(
    ViaCepService(injector()),
  );

  // Repositories
  injector.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(injector()),
  );
  injector.registerSingleton<CepRepository>(
    CepRepositoryImpl(injector()),
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
