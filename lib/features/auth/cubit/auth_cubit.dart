import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repository)
      : super(AuthState.initial(
          user: UserModel(),
        ));

  final IAuthRepository _repository;

  Future<void> chooseImageFromGallery() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        emit(AuthState.imageLoaded(image: File(pickedImage.path)));
      }
    } on Exception catch (e) {
      emit(AuthState.loadingFailure(
          "Error while picking image: ${e.toString()}"));
    }
  }

  Future<void> createAccount(
    String nickname,
    String email,
    String password,
    File? image,
  ) async {
    try {
      emit(const AuthState.loading(isLoading: true));
      final user =
          await _repository.createAccount(nickname, email, password, image);
      emit(const AuthState.loading(isLoading: false));
      emit(AuthState.loaded(user: user));
    } catch (e) {
      var error = e as FirebaseAuthException;
      emit(const AuthState.loading(isLoading: false));
      emit(AuthState.loadingFailure(error.message.toString()));
    }
  }

  Future<void> loginToAccount(
    String email,
    String password,
  ) async {
    try {
      emit(const AuthState.loading(isLoading: true));
      final user =
          await _repository.loginToAccount(email: email, password: password);
      emit(const AuthState.loading(isLoading: false));
      emit(AuthState.loaded(user: user));
    } on Exception catch (e) {
      var error = e as FirebaseAuthException;
      emit(const AuthState.loading(isLoading: false));
      emit(AuthState.loadingFailure(error.message.toString()));
    }
  }
}
