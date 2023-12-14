import 'package:share_plus/share_plus.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';

abstract class IVideoPlayerRepository {
  Future<void> updateTotalLikesInFirebase({
    required VideoModel videoModel,
    required bool isVideoLiked,
  });
  bool isVideoLiked(UserModel userModel, String videoId);
  Future<void> addCommentToFirestore(VideoModel videoModel, String message);
  Future<XFile?> getVideoXFileFromFirebase(String videoId, String name);
  Future<void> changeTotalShareCount(VideoModel videoModel);
}
