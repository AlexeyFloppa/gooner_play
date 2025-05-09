import 'package:flutter/material.dart';
import 'package:gooner_play/core/themes/app_theme.dart';
import 'package:gooner_play/core/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gooner Play',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.homeScreen,
      routes: AppRoutes.routes,
    );
  }
}