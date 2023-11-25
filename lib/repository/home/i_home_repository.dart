import 'package:tiktok_clone/models/comment/comment_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';

abstract class IHomeRepository {
  Future<List<VideoModel>> getVideoListFromFirestore();

  Future<List<CommentModel>> getCommentListFromFireStore(String videoId);
}
