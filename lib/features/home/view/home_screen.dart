import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/router/app_router.dart';
import 'package:tiktok_clone/ui/utils/firebase_utils.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const VideoPlayerRoute(),
        const UploadVideoRoute(),
        ProfileRoute(),
      ],
      lazyLoad: true,
      inheritNavigatorObservers: true,
      transitionBuilder: (context, child, animation) => child,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: Colors.black,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              if (value == 1 && !FirebaseUtils.checkLoginAccount()) {
                tabsRouter.setActiveIndex(2);
              } else if (value == 2) {
                tabsRouter.notifyListeners();
                tabsRouter.setActiveIndex(value);
              } else {
                tabsRouter.setActiveIndex(value);
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: FaIcon(FontAwesomeIcons.house),
                  ),
                  label: S.of(context).home),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Image.asset("assets/image/button_shape.png",
                        width: 43, height: 28),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: FaIcon(FontAwesomeIcons.solidUser),
                  ),
                  label: S.of(context).profile),
            ],
          ),
        );
      },
    );
  }
}
