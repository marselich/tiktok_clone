import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import 'package:tiktok_clone/features/profile/widgets/widgets.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final bool isRegister = false;

  @override
  Widget build(BuildContext context) {
    return isRegister ? const AuthProfile() : const NotAuthProfile();
  }
}
