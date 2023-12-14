import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/video_player/i_video_player_repository.dart';

import '../../../utils/firebase_utils.dart';

part 'video_player_state.dart';
part 'video_player_cubit.freezed.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit(this._videoPlayerRepository)
      : super(const VideoPlayerState.initial());

  final IVideoPlayerRepository _videoPlayerRepository;

  Future<void> init(VideoModel videoModel) async {
    try {
      final userModel =
          await FirebaseUtils.getCurrentUserModel() ?? UserModel();

      emit(VideoPlayerState.loaded(
        videoModel: videoModel,
        videoIsLiked:
            _videoPlayerRepository.isVideoLiked(userModel, videoModel.videoId),
      ));
    } catch (e) {
      emit(VideoPlayerState.loadingFailure(e.toString()));
    }
  }

  Future<void> changeLikeInVideo(VideoModel videoModel, bool isLiked) async {
    try {
      final newVideoModel = videoModel.copyWith(
        totalLikes:
            isLiked ? videoModel.totalLikes - 1 : videoModel.totalLikes + 1,
      );
      //final isLiked = !loadedState.videoIsLiked;

      emit(VideoPlayerState.loaded(
          videoModel: newVideoModel, videoIsLiked: !isLiked));
      await _videoPlayerRepository.updateTotalLikesInFirebase(
        videoModel: newVideoModel,
        isVideoLiked: !isLiked,
      );
    } catch (e) {
      emit(VideoPlayerState.loadingFailure(e.toString()));
    }
  }

  Future<_Loaded?> changeCommentsCountInVideo() async {
    try {
      if (state is _Loaded) {
        final newState = state as _Loaded;

        final newVideoModel = newState.videoModel.copyWith(
          totalComments: newState.videoModel.totalComments + 1,
        );

        emit(VideoPlayerState.loaded(
            videoModel: newVideoModel, videoIsLiked: newState.videoIsLiked));
        return newState;
      }
      // await _videoPlayerRepository.addTotalCommentsToFirestore(newVideoModel);
    } catch (e) {
      emit(VideoPlayerState.loadingFailure(e.toString()));
    }
    return null;
  }
}
