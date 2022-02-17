import 'package:flutter/material.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _materialRoute(
        Container(),
      );
  }
  throw Exception("Page not found.");
}

Route<dynamic> _materialRoute(Widget view) {
  return MaterialPageRoute(builder: (_) => view);
}
