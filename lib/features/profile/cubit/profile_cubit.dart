import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';
import 'package:tiktok_clone/repository/profile/i_profile_repository.dart';
import 'package:tiktok_clone/ui/utils/firebase_utils.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._authRepository, this._profileRepository)
      : super(const ProfileState.initial());
  final IAuthRepository _authRepository;
  final IProfileRepository _profileRepository;

  Future<void> loadingProfile() async {
    try {
      emit(const ProfileState.loading(isLoading: true));
      final userModel = await _authRepository.getUserInfo();

      List<String>? videoIdList = userModel?.videosIdList.cast<String>();

      final videoModelList = await _profileRepository.getVideoModelList(
        videoIdList ?? [],
      );

      emit(ProfileState.loaded(
        userModel: userModel,
        videoModelList: videoModelList,
      ));
    } on Exception catch (e) {
      emit(ProfileState.loadingFailure(e.toString()));
    }

    // await checkLogin();
    // await getVideoModelList();
  }

  Future<void> checkLogin() async {
    try {
      emit(const ProfileState.loading(isLoading: true));
      final userModel = await _authRepository.getUserInfo();
      emit(ProfileState.loaded(userModel: userModel));
    } on Exception catch (e) {
      emit(ProfileState.loadingFailure(e.toString()));
    }
  }

  Future<UserModel?> getUserInfo() async {
    return await _authRepository.getUserInfo();
  }

  Future<void> getVideoModelList(UserModel userModel) async {
    try {
      List<String>? videoIdList = userModel.videosIdList.cast<String>();

      final videoModelList = await _profileRepository.getVideoModelList(
        videoIdList,
      );

      emit(ProfileState.loaded(
        userModel: userModel,
        videoModelList: videoModelList,
      ));
    } on Exception catch (e) {
      emit(ProfileState.loadingFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(const ProfileState.loading(isLoading: true));
    await _authRepository.signOutFromAccount();
    emit(const ProfileState.loaded());
  }
}
