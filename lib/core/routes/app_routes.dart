import 'package:flutter/material.dart';
import 'package:gooner_play/features/home/screens/home_screen.dart';
import 'package:gooner_play/features/cat_jump/cat_jump_screen.dart';
import 'package:gooner_play/features/overlay/overlay_permission_screen.dart';

class AppRoutes {
  static const String homeScreen = '/';
  static const String catJumpScreen = '/cat-jump';
    static const String overlayPermissionScreen = '/overlay-permission';


  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => const HomeScreen(),
    overlayPermissionScreen: (context) => const OverlayPermissionScreen(),

    catJumpScreen: (context) => CatJumpScreen(),
  };
}
