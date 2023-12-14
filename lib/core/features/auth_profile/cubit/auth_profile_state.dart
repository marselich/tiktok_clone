part of 'auth_profile_cubit.dart';

@freezed
class AuthProfileState with _$AuthProfileState {
  const factory AuthProfileState.initial() = _Initial;
  const factory AuthProfileState.loaded({
    UserModel? userModel,
    List<VideoModel>? videoModelList,
    bool? isFollowing,
  }) = _Loaded;
  const factory AuthProfileState.loading() = _Loading;
  const factory AuthProfileState.loadingFailure(
    String? error,
  ) = _LoadingFailure;
}
