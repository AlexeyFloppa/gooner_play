import 'package:system_alert_window/system_alert_window.dart';

class OverlayControls {
  static Future<void> show() async {
    await SystemAlertWindow.showSystemWindow(
      height: 300,
      width: 300,
      header: SystemWindowHeader(title: SystemWindowText(text: "Script Controls")),
      body: SystemWindowBody(
        rows: [
          EachRow(columns: [
            EachColumn(text: SystemWindowText(text: "Control your script"))
          ])
        ],
      ),
    );
  }

  static Future<void> hide() async {
    await SystemAlertWindow.closeSystemWindow();
  }
}
