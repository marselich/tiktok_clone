part of 'video_list_cubit.dart';

@freezed
class VideoListState with _$VideoListState {
  const factory VideoListState.initial() = _Initial;
  const factory VideoListState.loaded({
    required List<VideoModel> videoModelList,
  }) = _Loaded;
  const factory VideoListState.loading({
    required bool isLoading,
  }) = _Loading;
  const factory VideoListState.loadingFailure(
    String? error,
  ) = _LoadingFailure;
}
