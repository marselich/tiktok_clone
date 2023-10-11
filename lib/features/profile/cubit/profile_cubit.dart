import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repository) : super(const ProfileState.initial());
  final IAuthRepository _repository;

  void checkLogin(UserModel? userModel) {
    emit(ProfileState.loaded(
      isRegister: _repository.checkLoginAccount(),
      userModel: userModel,
    ));
  }

  Future<UserModel?> getUserInfo() async {
    return await _repository.getUserInfo();
  }

  Future<void> signOut() async {
    emit(const ProfileState.loading(isLoading: true));
    await _repository.signOutFromAccount();
    emit(const ProfileState.loading(isLoading: false));
    emit(const ProfileState.loaded(isRegister: false));
  }
}
