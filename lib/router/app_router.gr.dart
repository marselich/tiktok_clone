// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    ProfileVideoPlayerRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileVideoPlayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileVideoPlayerScreen(
          key: args.key,
          videoModelList: args.videoModelList,
          currentVideoIndex: args.currentVideoIndex,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    UploadVideoFormRoute.name: (routeData) {
      final args = routeData.argsAs<UploadVideoFormRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UploadVideoFormScreen(
          key: args.key,
          cubit: args.cubit,
          videoFile: args.videoFile,
        ),
      );
    },
    UploadVideoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UploadVideoScreen(),
      );
    },
    VideoListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VideoListScreen(),
      );
    },
  };
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    String? userId,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.userId,
  });

  final Key? key;

  final String? userId;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [ProfileVideoPlayerScreen]
class ProfileVideoPlayerRoute
    extends PageRouteInfo<ProfileVideoPlayerRouteArgs> {
  ProfileVideoPlayerRoute({
    Key? key,
    required List<VideoModel> videoModelList,
    required int currentVideoIndex,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileVideoPlayerRoute.name,
          args: ProfileVideoPlayerRouteArgs(
            key: key,
            videoModelList: videoModelList,
            currentVideoIndex: currentVideoIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileVideoPlayerRoute';

  static const PageInfo<ProfileVideoPlayerRouteArgs> page =
      PageInfo<ProfileVideoPlayerRouteArgs>(name);
}

class ProfileVideoPlayerRouteArgs {
  const ProfileVideoPlayerRouteArgs({
    this.key,
    required this.videoModelList,
    required this.currentVideoIndex,
  });

  final Key? key;

  final List<VideoModel> videoModelList;

  final int currentVideoIndex;

  @override
  String toString() {
    return 'ProfileVideoPlayerRouteArgs{key: $key, videoModelList: $videoModelList, currentVideoIndex: $currentVideoIndex}';
  }
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UploadVideoFormScreen]
class UploadVideoFormRoute extends PageRouteInfo<UploadVideoFormRouteArgs> {
  UploadVideoFormRoute({
    Key? key,
    required UploadVideoCubit cubit,
    required File videoFile,
    List<PageRouteInfo>? children,
  }) : super(
          UploadVideoFormRoute.name,
          args: UploadVideoFormRouteArgs(
            key: key,
            cubit: cubit,
            videoFile: videoFile,
          ),
          initialChildren: children,
        );

  static const String name = 'UploadVideoFormRoute';

  static const PageInfo<UploadVideoFormRouteArgs> page =
      PageInfo<UploadVideoFormRouteArgs>(name);
}

class UploadVideoFormRouteArgs {
  const UploadVideoFormRouteArgs({
    this.key,
    required this.cubit,
    required this.videoFile,
  });

  final Key? key;

  final UploadVideoCubit cubit;

  final File videoFile;

  @override
  String toString() {
    return 'UploadVideoFormRouteArgs{key: $key, cubit: $cubit, videoFile: $videoFile}';
  }
}

/// generated route for
/// [UploadVideoScreen]
class UploadVideoRoute extends PageRouteInfo<void> {
  const UploadVideoRoute({List<PageRouteInfo>? children})
      : super(
          UploadVideoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UploadVideoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoListScreen]
class VideoListRoute extends PageRouteInfo<void> {
  const VideoListRoute({List<PageRouteInfo>? children})
      : super(
          VideoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideoListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
