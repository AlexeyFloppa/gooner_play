import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:gooner_play/core/routes/app_routes.dart';

class OverlayPermissionScreen extends StatefulWidget {
  const OverlayPermissionScreen({super.key});

  @override
  State<OverlayPermissionScreen> createState() => _OverlayPermissionScreenState();
}

class _OverlayPermissionScreenState extends State<OverlayPermissionScreen> {
  bool _permissionGranted = false;

  Future<void> checkPermission() async {
    final granted = await FlutterOverlayWindow.isPermissionGranted();
    setState(() {
      _permissionGranted = granted;
    });

    if (granted) {
      // Navigate to home screen using AppRoutes
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _permissionGranted
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  await FlutterOverlayWindow.requestPermission();
                  checkPermission();
                },
                child: const Text("Allow Overlay Permission"),
              ),
      ),
    );
  }
}
