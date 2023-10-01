import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/router/app_router.dart';
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
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bars),
          ),
        ],
        title: Center(
            child: Text(
          "Profile",
          style: theme.textTheme.titleMedium,
        )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.user,
                size: 100,
                color: Colors.black12,
              ),
              const SizedBox(height: 20),
              Text(
                "Create account or auth",
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: FilledButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const AuthRoute());
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (context) {
                    //     return const AuthBottomSheet();
                    //   },
                    // );
                  },
                  child: const Text("Sign Up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
