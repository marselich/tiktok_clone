import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/repository/upload_video/i_upload_video_repository.dart';

part 'upload_video_state.dart';
part 'upload_video_cubit.freezed.dart';

class UploadVideoCubit extends Cubit<UploadVideoState> {
  UploadVideoCubit(this._repository) : super(const UploadVideoState.initial());

  final IUploadVideoRepository _repository;

  Future<void> chooseVideo({required bool isCamera}) async {
    try {
      final videoFile = await ImagePicker().pickVideo(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
      );
      if (videoFile != null) {
        emit(UploadVideoState.videoUploaded(video: File(videoFile.path)));
      }
    } on Exception catch (e) {
      emit(UploadVideoState.loadingFailure(
          "Error while picking image: ${e.toString()}"));
    }
  }

  Future<void> uploadVideoInformation({
    required String artistSongName,
    required String descriptionTags,
    required String videoFilePath,
  }) async {
    try {
      emit(const UploadVideoState.loading(isLoading: true));
      await _repository.saveVideoInformationToFirestoreDatabase(
        artistSongName: artistSongName,
        descriptionTags: descriptionTags,
        videoFilePath: videoFilePath,
      );
      emit(const UploadVideoState.loading(isLoading: false));
      emit(const UploadVideoState.loaded());
    } catch (e) {
      emit(const UploadVideoState.loading(isLoading: false));
      emit(UploadVideoState.loadingFailure(e.toString()));
    }
  }
}
