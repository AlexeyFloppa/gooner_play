import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final Color accentColor;
  final String title;
  final Icon? icon;
  final ImageProvider? backgroundPicture;
  final VoidCallback? onTap;

  const GameButton({
    super.key,
    required this.accentColor,
    required this.title,
    this.icon,
    this.backgroundPicture,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            debugPrint('$title button tapped');
          },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundPicture == null ? accentColor : null,
          image: backgroundPicture != null
              ? DecorationImage(
                  image: backgroundPicture!,
                  fit: BoxFit.cover,
                )
              : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Row(
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
