import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';
import 'package:tiktok_clone/repository/profile/i_profile_repository.dart';
import 'package:tiktok_clone/ui/utils/shared_preferences_utils.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._authRepository, this._profileRepository)
      : super(const ProfileState.initial());
  final IAuthRepository _authRepository;
  final IProfileRepository _profileRepository;

  Future<void> loadingProfile({String? userId}) async {
    try {
      emit(const ProfileState.loading());
      final userModel = await _authRepository.getUserInfo(userId);

      final isFollowing = userModel != null
          ? userModel.folowersList.contains(SharedPreferencesUtils.getUserId())
          : false;

      final videoModelList = await _getVideoModelList(userModel);

      emit(ProfileState.loaded(
        userModel: userModel,
        videoModelList: videoModelList,
        isFollowing: isFollowing,
      ));
    } on Exception catch (e) {
      emit(ProfileState.loadingFailure(e.toString()));
    }

    // await checkLogin();
    // await getVideoModelList();
  }

  String? getCurrentUserUid() {
    return _authRepository.getCurrentUserUid();
  }

  Future<List<VideoModel>> _getVideoModelList(UserModel? userModel) async {
    List<String>? videoIdList = userModel?.videosIdList.cast<String>();

    return await _profileRepository.getVideoModelList(
      videoIdList ?? [],
    );
  }

  Future<void> signOut() async {
    emit(const ProfileState.loading());
    await SharedPreferencesUtils.clearSharedPref();
    await _authRepository.signOutFromAccount();
    emit(const ProfileState.loaded());
  }
}
