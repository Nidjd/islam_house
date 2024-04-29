import 'package:flutter/material.dart';
import 'package:islam_house/core/routing/app_routes.dart';

class IslamHouse extends StatelessWidget {
  final AppRoutes appRoutes;
  const IslamHouse({super.key, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRoutes.generateRoutes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}
