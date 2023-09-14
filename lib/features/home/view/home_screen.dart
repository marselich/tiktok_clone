import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/router/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        VideoPlayerRoute(),
        AddingVideoRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Главное"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_box), label: "Добавить"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Профиль"),
            ],
          ),
        );
      },
    );
  }
}
