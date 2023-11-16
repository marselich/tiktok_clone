import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/DI/tiktok_get_it.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/tiktok_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  await TiktokGetIt.init();

  runApp(TikTokApp());
}
