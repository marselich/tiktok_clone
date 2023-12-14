part of 'video_player_cubit.dart';

@freezed
class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState.initial() = _Initial;
  const factory VideoPlayerState.loaded({
    required VideoModel videoModel,
    required bool videoIsLiked,
  }) = _Loaded;
  const factory VideoPlayerState.loading({
    required bool isLoading,
  }) = _Loading;
  const factory VideoPlayerState.loadingFailure(
    String? error,
  ) = _LoadingFailure;
}
