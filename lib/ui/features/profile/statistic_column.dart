import 'package:flutter/material.dart';

class StatisticColumn extends StatelessWidget {
  const StatisticColumn({
    super.key,
    required this.topText,
    required this.bottomText,
  });

  final String topText;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          topText,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          bottomText,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
