import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TiktokActionButton extends StatelessWidget {
  const TiktokActionButton({
    super.key,
    required this.iconData,
    required this.text,
    this.onTap,
  });

  final IconData iconData;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          FaIcon(iconData, size: 36, color: Colors.white),
          const SizedBox(height: 5),
          Text(text, style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }
}
