import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/comment/comment_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';
import 'package:tiktok_clone/repository/video_player/i_video_player_repository.dart';

part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(this._videoPlayerRepository, this._homeRepository)
      : super(const CommentsState.initial());

  final IVideoPlayerRepository _videoPlayerRepository;
  final IHomeRepository _homeRepository;

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

  Future<void> addComment(VideoModel videoModel, String message) async {
    try {
      await _videoPlayerRepository.addCommentToFirestore(videoModel, message);
      await loadCommentList(videoModel.videoId);
    } on Exception catch (e) {
      emit(CommentsState.loadingFailure(e.toString()));
    }
  }
}
