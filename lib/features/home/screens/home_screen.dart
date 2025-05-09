import 'package:flutter/material.dart';
import 'package:gooner_play/features/home/widgets/game_button.dart';
import 'package:gooner_play/core/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gooner Play'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gooner Play is a platform showcasing AI-driven games. '
                'Developed by Alexey Belkin, this app demonstrates the potential of self-hosted AI models in mobile gaming.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const VerticalDivider(thickness: 1, width: 1),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add filter logic here
                      },
                      icon: const Icon(Icons.filter_list),
                      label: const Text('Filter'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    GameButton(
                      accentColor: Theme.of(context).colorScheme.primary,
                      title: 'Cat Jump',
                      icon: Icon(Icons.pets, color: Theme.of(context).colorScheme.onPrimary),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.catJumpScreen);
                      },
                    ),
                    const SizedBox(height: 10),
                    GameButton(
                      accentColor: Theme.of(context).colorScheme.secondary,
                      title: 'Chess AI',
                      icon: Icon(Icons.check, color: Theme.of(context).colorScheme.onSecondary),
                      onTap: null, // No navigation, will log debug message
                    ),
                    const SizedBox(height: 10),
                    GameButton(
                      accentColor: Theme.of(context).colorScheme.tertiary,
                      title: 'Tic Tac Toe',
                      icon: Icon(Icons.grid_on, color: Theme.of(context).colorScheme.onTertiary),
                      onTap: null, // No navigation, will log debug message
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}