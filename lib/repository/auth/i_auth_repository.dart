import 'dart:io';

import 'package:tiktok_clone/models/user/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> createAccount(
    String nickname,
    String email,
    String password,
    File image,
  );

  loginToAccount({
    required String email,
    required String password,
  });

  bool checkLoginAccount();

  Future<UserModel?> getUserInfo();

  Future<void> signOutFromAccount();
}
