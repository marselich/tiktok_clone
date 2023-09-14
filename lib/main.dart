import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/router/app_router.dart';
import 'package:tiktok_clone/ui/theme/theme.dart';

void main() {
  runApp(TikTokApp());
}

class TikTokApp extends StatelessWidget {
  TikTokApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'TikTok app clone',
      theme: themeData,
      routerConfig: _appRouter.config(),
    );
  }
}
