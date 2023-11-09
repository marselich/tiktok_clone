import 'dart:io';

import 'package:tiktok_clone/models/user/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> createAccount(
    String userName,
    String email,
    String password,
    File? image,
  );

  loginToAccount({
    required String email,
    required String password,
  });

  Future<UserModel?> getUserInfo(String? userId);
  String? getCurrentUserUid();

  Future<void> signOutFromAccount();
}
