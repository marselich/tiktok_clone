import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/core/features/video_player/cubit/video_player_cubit.dart';
import 'package:tiktok_clone/models/comment/comment_model.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';
import 'package:tiktok_clone/repository/video_player/i_video_player_repository.dart';

part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(
      this._videoPlayerRepository, this._homeRepository, this._videoPlayerCubit)
      : super(const CommentsState.initial());

  final IVideoPlayerRepository _videoPlayerRepository;
  final IHomeRepository _homeRepository;
  final VideoPlayerCubit _videoPlayerCubit;

  Future<void> loadCommentList(String videoId) async {
    try {
      emit(const CommentsState.loading());
      final commentList =
          await _homeRepository.getCommentListFromFireStore(videoId);
      emit(CommentsState.loaded(commentList: commentList));
    } on Exception catch (e) {
      emit(CommentsState.loadingFailure(e.toString()));
    }
  }

  Future<void> addComment(String message) async {
    try {
      final videoPlayerState =
          await _videoPlayerCubit.changeCommentsCountInVideo();
      if (videoPlayerState == null) {
        return;
      }
      await _videoPlayerRepository.addCommentToFirestore(
          videoPlayerState.videoModel, message);
      await loadCommentList(videoPlayerState.videoModel.videoId);
    } on Exception catch (e) {
      emit(CommentsState.loadingFailure(e.toString()));
    }
  }
}
