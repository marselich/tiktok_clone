import 'package:flutter/material.dart';

void showTikTokSnackBar(
  BuildContext context, {
  String? text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text ?? ""),
      duration: const Duration(seconds: 2),
    ),
  );
}
