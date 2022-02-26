import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_delivery_app_clean_arch/src/config/routes/app_routes.dart';
import 'package:flutter_delivery_app_clean_arch/src/config/themes/app_theme.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_delivery_app_clean_arch/src/injector.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/blocs/remote_authentication/remote_authentication_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    runApp(const DeliveryApp());
  });
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteAuthenticationBloc>(
      create: (_) => injector()..add(const CheckAuthentication()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        onGenerateRoute: onGenerateRoutes,
        theme: themeDataLight,
      ),
    );
  }
}
