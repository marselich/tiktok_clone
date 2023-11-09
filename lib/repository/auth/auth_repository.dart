import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<UserModel> createAccount(
    String userName,
    String email,
    String password,
    File? image,
  ) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    String imageDownloadUrl = "";
    if (image != null) {
      imageDownloadUrl = await _uploadImageToStorage(image);
    }

    final userModel = UserModel(
      id: credential.user!.uid,
      userName: userName,
      email: email,
      image: imageDownloadUrl,
      bio: "",
      name: userName,
      totalFollowers: 0,
      totalFollowing: 0,
      totalLikes: 0,
      videosIdList: List.empty(),
      favoriteVideosIdList: List.empty(),
      youtubeLink: "",
    );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(credential.user!.uid)
        .set(userModel.toJson());

    return userModel;
  }

  @override
  Future<UserModel> loginToAccount({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(credential.user!.uid)
        .get();

    final userModel = UserModel.fromSnap(snapshot);
    return userModel;
  }

  @override
  Future<UserModel?> getUserInfo(String? userId) async {
    User? user;
    if (userId == null) {
      user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return null;
      }
    }
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId ?? user!.uid)
        .get();

    UserModel? userModel = UserModel.fromSnap(snapshot);
    return userModel;
  }

  @override
  String? getCurrentUserUid() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    return user.uid;
  }

  @override
  Future<void> signOutFromAccount() async {
    await FirebaseAuth.instance.signOut();
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
