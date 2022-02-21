import 'package:flutter_delivery_app_clean_arch/src/data/datasources/remote/firebase_service.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/repositories/firebase_repository_impl.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/repositories/firebase_repository.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/usecases/login_usecase.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/blocs/remote_firebase/remote_firebase_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<FirebaseService>(
    FirebaseService(),
  );

  injector.registerSingleton<FirebaseRepository>(
    FirebaseRepositoryImpl(injector()),
  );

  injector.registerSingleton<LoginUseCase>(
    LoginUseCase(injector()),
  );

  injector.registerSingleton<RemoteFirebaseBloc>(
    RemoteFirebaseBloc(injector()),
  );
}
