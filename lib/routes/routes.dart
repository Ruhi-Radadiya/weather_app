import 'package:flutter/material.dart';
import 'package:weather_app/screens/homepage.dart';
import 'package:weather_app/screens/splash.dart';

class Routes {
  static String splashPage = '/';
  static String homePage = 'homePage';

  static Map<String, WidgetBuilder> myRoutes = {
    splashPage: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
  };
}
