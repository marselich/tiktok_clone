import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TiktokActionButton extends StatelessWidget {
  const TiktokActionButton({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
    required this.isTapped,
  });

  final IconData iconData;
  final String text;
  final VoidCallback onTap;
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
                top: 0,
                left: 0,
                child: FaIcon(
                  iconData,
                  size: 38,
                  color: Colors.black12,
                ),
              ),
              isTapped
                  ? FaIcon(
                      iconData,
                      size: 36,
                      color: theme.primaryColor,
                    )
                  : FaIcon(
                      iconData,
                      size: 36,
                      color: Colors.white,
                    ),
            ],
          ),
          const SizedBox(height: 5),
          Text(text,
              style: theme.textTheme.labelLarge?.copyWith(
                shadows: [
                  const Shadow(
                    color: Colors.black,
                    blurRadius: 0.8,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
