import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/video_player/i_video_player_repository.dart';

part 'video_player_state.dart';
part 'video_player_cubit.freezed.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit(this._repository) : super(const VideoPlayerState.initial());

  final IVideoPlayerRepository _repository;

  void init(VideoModel videoModel) {
    try {
      final userModel = GetIt.I.get<UserModel>();

      emit(VideoPlayerState.loaded(
        videoModel: videoModel,
        videoIsLiked: _repository.isVideoLiked(userModel, videoModel.videoId),
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
      await _repository.updateTotalLikesInFirebase(
        videoModel: newVideoModel,
        isVideoLiked: !isLiked,
      );
    } catch (e) {
      emit(VideoPlayerState.loadingFailure(e.toString()));
    }
  }
}
