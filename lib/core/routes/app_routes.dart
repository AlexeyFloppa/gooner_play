import 'package:flutter/material.dart';
import 'package:gooner_play/features/games/idle_games/presentation/screens/idle_games_screen.dart';
import 'package:gooner_play/features/home/presentation/screens/home_screen.dart';
import 'package:gooner_play/features/games/cat_jump/presentation/screens/cat_jump_screen.dart';

class AppRoutes {
  static const String homeScreen = '/';
  static const String catJumpScreen = '/cat-jump';
  static const String overlayPermissionScreen = '/overlay-permission';
  static const String idleGamesScreen = '/global-idle';

  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => const HomeScreen(),
    catJumpScreen: (context) => CatJumpScreen(),
    idleGamesScreen: (context) => const IdleGamesScreen(),
  };
}
