import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:gooner_play/shared/widgets/permission_status_container.dart';
import 'package:gooner_play/shared/widgets/game_enable_container.dart';

class PermissionScreenLayout extends StatefulWidget {
  final String title;
  final Widget? description;
  final List<Widget> children;

  /// List of containers with GameEnableContainer parameters
  final List<GameEnableContainer>? containers;

  /// Optional footer widget
  final String? footer;

  const PermissionScreenLayout({
    super.key,
    required this.title,
    this.description,
    this.children = const [],
    this.containers,
    this.footer, // add footer to constructor
  });

  @override
  State<PermissionScreenLayout> createState() => _PermissionScreenLayoutState();
}

class _PermissionScreenLayoutState extends State<PermissionScreenLayout>
    with WidgetsBindingObserver {
  bool _layoutPermission = false;

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
    final layout = await FlutterOverlayWindow.isPermissionGranted();
    setState(() {
      _layoutPermission = layout;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allAllowed = _layoutPermission;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Footer under AppBar
            if (widget.footer != null) ...[
                SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                  widget.footer!,
                  fit: BoxFit.cover,
                  ),
                ),
                ),
              
              if (widget.description != null || widget.footer != null) ...[
                const Divider(height: 32),
              ],
            ],
            // Description under Footer
            if (widget.description != null) ...[
              widget.description!,
              // if (widget.description != null) ...[
              //   const Divider(height: 32),
              // ],
              SizedBox(height: 24),
            ],

            // Status container
            const PermissionStatusContainer(),
            // Containers
            if (widget.containers != null && widget.containers!.isNotEmpty) ...[
              const SizedBox(height: 24),
              ...widget.containers!.map(
                (container) => AbsorbPointer(
                  absorbing: !allAllowed,
                  child: Opacity(
                    opacity: allAllowed ? 1.0 : 0.5,
                    child: container,
                  ),
                ),
              ),
            ],
            // Children
            if (widget.children.isNotEmpty) ...[
              const SizedBox(height: 24),
              ...widget.children.map(
                (child) => AbsorbPointer(
                  absorbing: !allAllowed,
                  child: Opacity(
                    opacity: allAllowed ? 1.0 : 0.5,
                    child: child,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
