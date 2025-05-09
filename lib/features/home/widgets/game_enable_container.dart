import 'dart:developer';

import 'package:flutter/material.dart';

class GameEnableContainer extends StatefulWidget {
  final String title;
  final VoidCallback onEnable;
  final VoidCallback onDisable;

  const GameEnableContainer({
    Key? key,
    required this.title,
    required this.onEnable,
    required this.onDisable,
  }) : super(key: key);

  @override
  _GameEnableContainerState createState() => _GameEnableContainerState();
}

class _GameEnableContainerState extends State<GameEnableContainer> {
  bool isGameEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  log('Settings tapped');
                },
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: Text('Instruments'),
                onTap: () {
                  // Add tap animation (default ripple effect)
                },
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isGameEnabled = !isGameEnabled;
                    });
                    if (isGameEnabled) {
                      widget.onEnable();
                    } else {
                      widget.onDisable();
                    }
                  },
                  child: Text(isGameEnabled ? 'Disable Game' : 'Enable Game'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
