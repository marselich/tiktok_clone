import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/profile/i_profile_repository.dart';

part 'auth_profile_state.dart';
part 'auth_profile_cubit.freezed.dart';

class AuthProfileCubit extends Cubit<AuthProfileState> {
  AuthProfileCubit(this._repository) : super(const AuthProfileState.initial());

  final IProfileRepository _repository;

  void init(
    UserModel userModel,
    bool isFollowing,
    List<VideoModel> videoModelList,
  ) {
    emit(AuthProfileState.loaded(
      userModel: userModel,
      isFollowing: isFollowing,
      videoModelList: videoModelList,
    ));
  }

  Future<void> followingToUser(UserModel userModel, bool isFollowing) async {
    try {
      emit(const AuthProfileState.loading());

      final newUserModel = userModel.copyWith(
        totalFollowers: isFollowing
            ? userModel.totalFollowers - 1
            : userModel.totalFollowers + 1,
      );

      await _repository.followingToUser(userModel, isFollowing);
      //final videoModelList = await _getVideoModelList(userModel);
      // emit(ProfileState.loaded(
      //   userModel: newUserModel,
      //   videoModelList: videoModelList,
      //   isFollowing: !isFollowing,
      // ));

      emit(AuthProfileState.loaded(
        userModel: newUserModel,
        isFollowing: !isFollowing,
      ));
    } on Exception catch (e) {
      emit(AuthProfileState.loadingFailure(e.toString()));
    }
  }
}
