import 'package:flutter/material.dart';
import 'package:islam_house/core/routing/app_routes.dart';
import 'package:islam_house/core/utils/service_locator.dart';
import 'package:islam_house/islam_house.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  runApp(
    IslamHouse(
      appRoutes: AppRoutes(),
    ),
  );
}
