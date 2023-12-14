import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TikTokOutlinedButton extends StatelessWidget {
  const TikTokOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        side: const BorderSide(width: 2, color: Colors.black12),
      ),
      icon: icon == null ? const SizedBox() : FaIcon(icon),
      label: Text(
        text,
        style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
      ),
    );
  }
}
