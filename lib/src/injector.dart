import 'package:dio/dio.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/firebase_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/via_cep_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/repositories/firebase_repository_impl.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/repositories/via_cep_repository_impl.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/firebase_repository.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/via_cep_repository.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/cep_search_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/check_auth_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/create_user_with_email_password_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/login_with_email_password_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/signout_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/blocs/remote_firebase/remote_firebase_bloc.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/blocs/remote_viacep/remote_viacep_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Datasources
  injector.registerSingleton<FirebaseService>(
    FirebaseService(),
  );
  injector.registerSingleton<ViaCepService>(
    ViaCepService(injector()),
  );

  // Repositories
  injector.registerSingleton<FirebaseRepository>(
    FirebaseRepositoryImpl(injector()),
  );
  injector.registerSingleton<ViaCepRepository>(
    ViaCepRepositoryImpl(injector()),
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

  // Blocs
  injector.registerSingleton<RemoteFirebaseBloc>(
    RemoteFirebaseBloc(injector(), injector(), injector(), injector()),
  );
  injector.registerSingleton<RemoteViacepBloc>(
    RemoteViacepBloc(injector()),
  );
}
