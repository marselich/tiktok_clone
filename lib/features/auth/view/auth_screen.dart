import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/auth/cubit/auth_cubit.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';
import 'package:tiktok_clone/router/app_router.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _cubit = AuthCubit(GetIt.I.get<IAuthRepository>());

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
          body: BlocProvider(
            create: (context) => _cubit,
            child: child,
          ),
        );
      },
    );
  }
}
