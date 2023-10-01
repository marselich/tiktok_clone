import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/router/app_router.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        LoginRoute(),
        RegisterRoute(),
      ],
      builder: (context, child, tabController) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).auth),
            bottom: TabBar(
              tabs: const [
                Tab(text: "Login"),
                Tab(text: "Register"),
              ],
              controller: tabController,
              onTap: (value) {
                tabsRouter.setActiveIndex(value);
              },
            ),
          ),
          body: child,
        );
      },
    );
  }
}
