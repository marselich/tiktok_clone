part of 'upload_video_cubit.dart';

@freezed
class UploadVideoState with _$UploadVideoState {
  const factory UploadVideoState.initial() = _Initial;
  const factory UploadVideoState.loaded() = _Loaded;
  const factory UploadVideoState.loading({
    required bool isLoading,
  }) = _Loading;
  const factory UploadVideoState.loadingFailure(
    String? error,
  ) = _LoadingFailure;
  const factory UploadVideoState.videoUploaded({
    File? video,
  }) = _VideoUploaded;
}
