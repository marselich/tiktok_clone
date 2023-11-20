import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/video_player/i_video_player_repository.dart';
import 'package:tiktok_clone/ui/utils/firebase_utils.dart';
import 'package:tiktok_clone/ui/utils/shared_preferences_utils.dart';

class VideoPlayerRepository implements IVideoPlayerRepository {
  @override
  Future<void> updateTotalLikesInFirebase({
    required VideoModel videoModel,
    required bool isVideoLiked,
  }) async {
    final userModel = await FirebaseUtils.getCurrentUserModel();
    // final user = FirebaseAuth.instance.currentUser;
    if (userModel == null) {
      return;
    }

    if (isVideoLiked) {
      await _updateLikeInVideoAndProfile(videoModel, 1);
      await _updateVideoIdInFavoriteList(userModel, videoModel);
    } else {
      await _updateLikeInVideoAndProfile(videoModel, -1);
      await _deleteVideoIdInFavoriteList(userModel, videoModel);
    }
  }

  @override
  bool isVideoLiked(UserModel userModel, String videoId) {
    return userModel.favoriteVideosIdList.contains(videoId);
  }

  Future<void> _updateVideoIdInFavoriteList(
      UserModel userModel, VideoModel videoModel) async {
    final userReference =
        FirebaseFirestore.instance.collection("users").doc(userModel.id);

    List<dynamic> newFavoriteVideosIdList = [];
    newFavoriteVideosIdList.addAll(userModel.favoriteVideosIdList);
    newFavoriteVideosIdList.add(videoModel.videoId);

    await userReference.update(userModel
        .copyWith(
          favoriteVideosIdList: newFavoriteVideosIdList,
          totalLikes: SharedPreferencesUtils.getUserId() == videoModel.userId
              ? userModel.totalLikes + 1
              : userModel.totalLikes,
        )
        .toJson());
  }

  Future<void> _deleteVideoIdInFavoriteList(
      UserModel userModel, VideoModel videoModel) async {
    final userReference =
        FirebaseFirestore.instance.collection("users").doc(userModel.id);

    List<dynamic> newFavoriteVideosIdList = [];
    newFavoriteVideosIdList.addAll(userModel.favoriteVideosIdList);
    newFavoriteVideosIdList.remove(videoModel.videoId);

    await userReference.update(userModel
        .copyWith(
          favoriteVideosIdList: newFavoriteVideosIdList,
          totalLikes: SharedPreferencesUtils.getUserId() == videoModel.userId
              ? userModel.totalLikes - 1
              : userModel.totalLikes,
        )
        .toJson());
  }

  Future<void> _updateLikeInVideoAndProfile(
      VideoModel videoModel, int likeCount) async {
    final videoReference =
        FirebaseFirestore.instance.collection("videos").doc(videoModel.videoId);

    //!TODO

    await videoReference.update(
      videoModel.toJson(),
    );

    if (SharedPreferencesUtils.getUserId() != videoModel.userId) {
      final userReference =
          FirebaseFirestore.instance.collection("users").doc(videoModel.userId);
      final userModel = UserModel.fromSnap(await userReference.get());
      await userReference.update(
        userModel
            .copyWith(totalLikes: userModel.totalLikes + likeCount)
            .toJson(),
      );
    }
  }
}
