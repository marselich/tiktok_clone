import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';

abstract class IVideoPlayerRepository {
  Future<void> updateTotalLikesInFirebase({
    required VideoModel videoModel,
    required bool isVideoLiked,
  });
  bool isVideoLiked(UserModel userModel, String videoId);
}
