import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoContentContainer extends StatelessWidget {
  const NoContentContainer({
    super.key,
    required this.noContentText,
    this.iconColor,
  });

  final String noContentText;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.faceSadTear,
            size: 100,
            color: iconColor ?? Colors.white,
          ),
          const SizedBox(height: 20),
          Text(
            noContentText,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
