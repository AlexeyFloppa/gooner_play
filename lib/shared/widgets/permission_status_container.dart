import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class PermissionStatusContainer extends StatefulWidget {
  const PermissionStatusContainer({super.key});

  @override
  State<PermissionStatusContainer> createState() =>
      _PermissionStatusContainerState();
}

class _PermissionStatusContainerState extends State<PermissionStatusContainer>
    with WidgetsBindingObserver {
  bool _overlayPermission = false;
  bool _dropdownOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermissions();
    }
    super.didChangeAppLifecycleState(state);
  }

  Future<void> _checkPermissions() async {
    final overlay = await FlutterOverlayWindow.isPermissionGranted();
    setState(() {
      _overlayPermission = overlay;
    });
  }

  Widget _permissionStatusIcon(bool allowed) => Icon(
        allowed ? Icons.check_circle : Icons.cancel,
        color: allowed ? Colors.green : Colors.red,
      );

  Future<void> _openOverlayPermissionSettings() async {
    await FlutterOverlayWindow.requestPermission();
    await _checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    final allAllowed = _overlayPermission;
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        setState(() {
          _dropdownOpen = !_dropdownOpen;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        constraints: const BoxConstraints(
          minHeight: 64,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                _permissionStatusIcon(allAllowed),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    allAllowed
                        ? "All permissions are enabled"
                        : "Few permissions are missing",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(
                  _dropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
            if (_dropdownOpen)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: _openOverlayPermissionSettings,
                  child: Row(
                    children: [
                      _permissionStatusIcon(_overlayPermission),
                      const SizedBox(width: 16),
                      Text(
                        "Overlay Permission",
                        style: TextStyle(
                          color: _overlayPermission ? Colors.green : Colors.red,
                          fontSize: 16,
                        ),
                      ),
                      if (!_overlayPermission)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "(Tap to allow)",
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
