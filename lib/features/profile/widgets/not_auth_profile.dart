import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/ui/widgets/auth_bottom_sheet.dart';

class NotAuthProfile extends StatelessWidget {
  const NotAuthProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.burger)),
        ],
        title: Center(
            child: Text(
          "Profile",
          style: theme.textTheme.titleMedium,
        )),
      ),
      body: Column(
        children: [
          const FaIcon(FontAwesomeIcons.person, size: 40),
          const Text("Create account"),
          FilledButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const AuthBottomSheet();
                },
              );
            },
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
