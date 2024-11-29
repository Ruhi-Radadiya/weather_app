import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/weather_controller.dart';
import '../routes/routes.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherController(),
        )
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.myRoutes,
      ),
    );
  }
}
