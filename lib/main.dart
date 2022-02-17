import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_arch/src/config/routes/app_routes.dart';
import 'package:flutter_delivery_app_clean_arch/src/config/themes/app_theme.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_delivery_app_clean_arch/src/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      onGenerateRoute: onGenerateRoutes,
      theme: themeDataLight,
    );
  }
}
