import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/video_player/i_video_player_repository.dart';

class VideoPlayerRepository implements IVideoPlayerRepository {
  @override
  Future<bool> updateTotalLikesInFirebase({
    required VideoModel videoModel,
    required bool isVideoLiked,
  }) async {
    final userModel = GetIt.I.get<UserModel>();
    // final user = FirebaseAuth.instance.currentUser;
    if (userModel.id == "") {
      return false;
    }

    // final userReference =
    //     FirebaseFirestore.instance.collection("users").doc(user.uid);

    // final userModel = UserModel.fromSnap(await userReference.get());

    if (!isVideoLiked) {
      await _updateLikeInVideoAndProfile(videoModel, 1);
      await _updateVideoIdInFavoriteList(userModel, videoModel.videoId);
    } else {
      await _updateLikeInVideoAndProfile(videoModel, -1);
      await _deleteVideoIdInFavoriteList(userModel, videoModel.videoId);
    }

    return true;
  }

  @override
  bool isVideoLiked(UserModel userModel, String videoId) {
    // final userModel = await GetIt.I.getAsync<UserModel>();
    // //  final user = FirebaseAuth.instance.currentUser;
    // if (userModel.id == "") {
    //   return null;
    // }

    // final userReference =
    //     FirebaseFirestore.instance.collection("users").doc(user.uid);

    // final userModel = UserModel.fromSnap(await userReference.get());

    return userModel.favoriteVideosIdList.contains(videoId);
  }

  Future<void> _updateVideoIdInFavoriteList(
      UserModel userModel, String videoId) async {
    final userReference =
        FirebaseFirestore.instance.collection("users").doc(userModel.id);

    List<dynamic> newFavoriteVideosIdList = [];
    newFavoriteVideosIdList.addAll(userModel.favoriteVideosIdList);
    newFavoriteVideosIdList.add(videoId);

    await userReference.update(userModel
        .copyWith(
          favoriteVideosIdList: newFavoriteVideosIdList,
        )
        .toJson());
  }

  Future<void> _deleteVideoIdInFavoriteList(
      UserModel userModel, String videoId) async {
    final userReference =
        FirebaseFirestore.instance.collection("users").doc(userModel.id);

    List<dynamic> newFavoriteVideosIdList = [];
    newFavoriteVideosIdList.addAll(userModel.favoriteVideosIdList);
    newFavoriteVideosIdList.remove(videoId);

    await userReference.update(userModel
        .copyWith(
          favoriteVideosIdList: newFavoriteVideosIdList,
        )
        .toJson());
  }

  Future<void> _updateLikeInVideoAndProfile(
      VideoModel videoModel, int likeCount) async {
    final videoReference =
        FirebaseFirestore.instance.collection("videos").doc(videoModel.videoId);

    // final videoModel =
    //     VideoModel.fromDocumentSnapshot(await videoReference.get());

    final userReference =
        FirebaseFirestore.instance.collection("users").doc(videoModel.userId);

    final userModel = UserModel.fromSnap(await userReference.get()); //!TODO

    await videoReference.update(
      videoModel.toJson(),
    );
    await userReference.update(
      userModel.copyWith(totalLikes: userModel.totalLikes + likeCount).toJson(),
    );
  }
}
