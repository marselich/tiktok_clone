import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/repository/auth/auth_repository.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';

class TiktokGetIt {
  static void init() {
    GetIt.I.registerLazySingleton<IAuthRepository>(() => AuthRepository());
  }
}
