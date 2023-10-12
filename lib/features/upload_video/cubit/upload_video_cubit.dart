import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_video_state.dart';
part 'upload_video_cubit.freezed.dart';

class UploadVideoCubit extends Cubit<UploadVideoState> {
  UploadVideoCubit() : super(const UploadVideoState.initial());

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
}
