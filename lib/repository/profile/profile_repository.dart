import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/profile/i_profile_repository.dart';
import 'package:tiktok_clone/core/utils/shared_preferences_utils.dart';

class ProfileRepository extends IProfileRepository {
  @override
  Future<List<VideoModel>> getVideoModelList(List<String> videoIdList) async {
    final videoModelList = videoIdList.map((videoId) async {
      final videoSnapshot = await FirebaseFirestore.instance
          .collection("videos")
          .doc(videoId)
          .get();

      return VideoModel.fromDocumentSnapshot(videoSnapshot);
    }).toList();

    return await Future.wait(videoModelList.reversed);
  }

  @override
  Future<VideoModel> getVideoModel(String videoId) async {
    final videoModel = await FirebaseFirestore.instance
        .collection("videos")
        .doc(videoId)
        .get();

    return VideoModel.fromDocumentSnapshot(videoModel);
  }

  @override
  Future<void> followingToUser(UserModel userModel, bool isFollowing) async {
    final currentUserId = SharedPreferencesUtils.getUserId();
    if (currentUserId.isEmpty) {
      throw "You are not logged in";
    }

    await _addUserIdToFollowingList(currentUserId, userModel.id, isFollowing);
    await _addUserIdToFollowerList(currentUserId, userModel, isFollowing);
  }

  Future<void> _addUserIdToFollowingList(
    String currentUserId,
    String userId,
    bool isFollowing,
  ) async {
    final currentUserRef =
        FirebaseFirestore.instance.collection("users").doc(currentUserId);

    final userModel = UserModel.fromSnap(await currentUserRef.get());

    List newFollowingList = [];
    newFollowingList.addAll(userModel.folowingList);

    if (isFollowing) {
      newFollowingList.remove(userId);
    } else {
      newFollowingList.add(userId);
    }

    await currentUserRef.update(
      userModel
          .copyWith(
            folowingList: newFollowingList,
            totalFollowing: newFollowingList.length,
          )
          .toJson(),
    );
  }

  Future<void> _addUserIdToFollowerList(
    String currentUserId,
    UserModel userModel,
    bool isFollowing,
  ) async {
    final userRef =
        FirebaseFirestore.instance.collection("users").doc(userModel.id);

    List newFollowersList = [];
    newFollowersList.addAll(userModel.folowersList);

    if (isFollowing) {
      newFollowersList.remove(currentUserId);
    } else {
      newFollowersList.add(currentUserId);
    }

    await userRef.update(
      userModel
          .copyWith(
            folowersList: newFollowersList,
            totalFollowers: newFollowersList.length,
          )
          .toJson(),
    );
  }
}
