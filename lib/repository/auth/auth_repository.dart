import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<UserModel> createAccount(
    String nickname,
    String email,
    String password,
    File image,
  ) async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String imageDownloadUrl = await _uploadImageToStorage(image);

    final userModel = UserModel(
      id: credential.user!.uid,
      nickname: nickname,
      email: email,
      image: imageDownloadUrl,
    );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(credential.user!.uid)
        .set(userModel.toJson());

    return userModel;
  }

  Future<String> _uploadImageToStorage(File image) async {
    final reference = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    final taskSnapshot = await reference.putFile(image);

    return await taskSnapshot.ref.getDownloadURL();
  }
}
