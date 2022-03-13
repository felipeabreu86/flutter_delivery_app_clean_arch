import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/screens/home/home_screen.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/screens/login/login_screen.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/screens/startup/startup_screen.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case kInitialRoute:
      return _materialRoute(
        const StartupScreen(),
      );
    case kLoginScreenRoute:
      return _materialRoute(
        const LoginScreen(),
      );
    case kHomeScreenRoute:
      return _materialRoute(
        const HomeScreen(),
      );
  }
  throw Exception("Página não encontrada.");
}

Route<dynamic> _materialRoute(Widget view) {
  return MaterialPageRoute(builder: (_) => view);
}
