import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TikTokTextButton extends StatelessWidget {
  const TikTokTextButton({
    super.key,
    required this.textButton,
    this.iconData,
    this.onPressed,
  });

  final String textButton;
  final IconData? iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: Center(
              child: iconData != null
                  ? FaIcon(iconData, size: 20)
                  : const SizedBox(),
            ),
          ),
          const SizedBox(width: 5),
          Text(textButton, style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }
}
