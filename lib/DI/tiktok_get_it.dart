import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/repository/auth/auth_repository.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';
import 'package:tiktok_clone/repository/home/home_repository.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';
import 'package:tiktok_clone/repository/profile/i_profile_repository.dart';
import 'package:tiktok_clone/repository/profile/profile_repository.dart';
import 'package:tiktok_clone/repository/upload_video/i_upload_video_repository.dart';
import 'package:tiktok_clone/repository/upload_video/upload_video_repository.dart';
import 'package:tiktok_clone/repository/video_player/i_video_player_repository.dart';
import 'package:tiktok_clone/repository/video_player/video_player_repository.dart';

class TiktokGetIt {
  static Future<void> init() async {
    GetIt.I.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(),
    );
    GetIt.I.registerLazySingleton<IUploadVideoRepository>(
      () => UploadVideoRepository(),
    );
    GetIt.I.registerLazySingleton<IHomeRepository>(
      () => HomeRepository(),
    );
    GetIt.I.registerLazySingleton<IProfileRepository>(
      () => ProfileRepository(),
    );
    GetIt.I.registerLazySingleton<IVideoPlayerRepository>(
      () => VideoPlayerRepository(),
    );

    // GetIt.I.registerSingletonAsync<UserModel>(() async {
    //   return await FirebaseUtils.getCurrentUserModel() ?? UserModel();
    // });

    GetIt.I.registerSingletonAsync<SharedPreferences>(() async {
      return await SharedPreferences.getInstance();
    });

    await GetIt.I.allReady();
  }
}
