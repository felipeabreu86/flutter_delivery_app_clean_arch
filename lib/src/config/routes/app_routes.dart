import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/views/login_view.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _materialRoute(
        const LoginScreen(),
      );
  }
  throw Exception("Page not found.");
}

Route<dynamic> _materialRoute(Widget view) {
  return MaterialPageRoute(builder: (_) => view);
}
