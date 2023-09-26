import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/router/app_router.dart';
import 'package:tiktok_clone/ui/widgets/tiktok_outlined_button.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).authInTiktok,
              style: theme.textTheme.headlineMedium,
            ),
            TikTokOutlinedButton(
              onPressed: () {
                AutoRouter.of(context).push(AuthRoute());
              },
              text: S.of(context).authWithEmail,
              icon: FontAwesomeIcons.user,
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).dontHaveAnAccountYet,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    S.of(context).register,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: theme.colorScheme.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
