import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import '../../../../../shared/widgets/game_enable_container.dart';
import '../../overlay_window.dart';
import '../../../../../shared/widgets/permission_screen_layout.dart';

class IdleGamesScreen extends StatelessWidget {
  const IdleGamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionScreenLayout(
      title: 'Idle Games AI',
      footer: 'lib/assets/screens/idle_games/idle_games_footer.png',
      description: const Text(
        'This feature allows you to run Idle Games with AI assistance. '
        'You can enable or disable the overlay for these games.',
      ),
      containers: [
        GameEnableContainer(
          title: 'Idle Games AI Model',
          onEnable: () async {
            log("Enabled");
            if (!await FlutterOverlayWindow.isPermissionGranted()) {
              log("Requesting permission for overlay");
              await FlutterOverlayWindow.requestPermission();
            }
            await OverlayControls.show();
            log("Not Requesting permission for overlay");
          },
          onDisable: () async {
            log("Disabled");
            await OverlayControls.hide();
          },
        ),
      ],
    );
  }
}
