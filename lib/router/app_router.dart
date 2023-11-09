import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/upload_video/cubit/upload_video_cubit.dart';
import 'package:tiktok_clone/features/upload_video/upload_video.dart';
import 'package:tiktok_clone/features/home/home.dart';
import 'package:tiktok_clone/features/profile/profile.dart';
import 'package:tiktok_clone/features/video_player/video_player.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/features/auth/auth.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: "/",
          children: [
            AutoRoute(page: VideoPlayerRoute.page, path: "video-player"),
            AutoRoute(
              page: UploadVideoRoute.page,
              path: "upload-video",
            ),
            AutoRoute(page: ProfileRoute.page, path: "profile"),
          ],
        ),
        AutoRoute(
          page: UploadVideoFormRoute.page,
          path: "/upload-form",
        ),
        AutoRoute(
          page: AuthRoute.page,
          path: "/auth",
          children: [
            AutoRoute(page: RegisterRoute.page, path: "register"),
            AutoRoute(page: LoginRoute.page, path: "login"),
          ],
        ),
        AutoRoute(
          page: ProfileVideoPlayerRoute.page,
          path: "/profile-video-player",
        ),
        CustomRoute(
          page: ProfileRoute.page,
          path: "/user-profile",
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
      ];
}
