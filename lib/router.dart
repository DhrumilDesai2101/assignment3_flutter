import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'calculator_page.dart';

class AppRouter {
  static FluroRouter router = FluroRouter();

  static void setupRouter() {
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          return CalculatorPage(); // Make sure CalculatorPage returns a Widget
        },
      ),
    );
    // Add more routes as needed
  }
}
