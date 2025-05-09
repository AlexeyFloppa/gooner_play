import 'dart:developer';
import 'package:flutter/material.dart';
import '../home/widgets/game_enable_container.dart';

class CatJumpScreen extends StatelessWidget {
  const CatJumpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Jump Runner AI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GameEnableContainer(title: 'Cat Jump Runner AI', onEnable: () {log("Enabled");  }, onDisable: () {log("Disabled");  },),
      ),
    );
  }
}
