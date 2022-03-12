import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/views/home/home_view.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/views/login/login_view.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/views/startup/startup_view.dart';

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
  throw Exception("Page not found.");
}

Route<dynamic> _materialRoute(Widget view) {
  return MaterialPageRoute(builder: (_) => view);
}
