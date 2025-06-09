import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class OverlayControls {
  static Future<void> show() async {
    await FlutterOverlayWindow.showOverlay(
      height: 300,
      width: 300,
      alignment: OverlayAlignment.center,
      flag: OverlayFlag.defaultFlag,
      overlayTitle: "Script Controls",
      overlayContent: "Control your script",
    );
  }

  static Future<void> hide() async {
    await FlutterOverlayWindow.closeOverlay();
  }
}
