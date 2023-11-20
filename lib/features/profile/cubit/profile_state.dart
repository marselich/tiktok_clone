part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loaded({
    UserModel? userModel,
    List<VideoModel>? videoModelList,
    bool? isFollowing,
  }) = _Loaded;
  const factory ProfileState.widgetLoaded({
    UserModel? userModel,
    bool? isFollowing,
  }) = _WidgetLoaded;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.widgetLoading() = _WidgetLoading;
  const factory ProfileState.loadingFailure(
    String? error,
  ) = _LoadingFailure;
}
