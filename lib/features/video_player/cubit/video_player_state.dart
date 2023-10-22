part of 'video_player_cubit.dart';

@freezed
class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState.initial() = _Initial;
  const factory VideoPlayerState.loaded({
    required VideoModel model,
  }) = _Loaded;
  const factory VideoPlayerState.loading({
    required bool isLoading,
  }) = _Loading;
  const factory VideoPlayerState.loadingFailure(
    String? error,
  ) = _LoadingFailure;
  const factory VideoPlayerState.pageScrolled({
    @Default(0) int currentPage,
    @Default(false) bool isOnPageTurning,
  }) = _PageScrolled;
}
