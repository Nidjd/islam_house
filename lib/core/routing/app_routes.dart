import 'package:flutter/material.dart';
import 'package:islam_house/core/routing/routes.dart';
import 'package:islam_house/features/home/presentation/views/home_page.dart';

class AppRoutes {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('not defined for ${settings.name}'),
          ),
        );
    }
  }
}