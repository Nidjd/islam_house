import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, BuildContext context,
      [Object? data]) {
    return Navigator.of(context).pushNamed(routeName, arguments: data);
  }

  Future<dynamic> pushReplacementNamed(String routeName, BuildContext context) {
    return Navigator.of(context).pushReplacementNamed(routeName);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      String routeName, BuildContext context, RoutePredicate predicate) {
    return Navigator.of(context).pushNamedAndRemoveUntil(routeName, predicate);
  }

  void pop(context) => Navigator.of(context).pop();
}
