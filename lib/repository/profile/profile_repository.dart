import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/profile/i_profile_repository.dart';

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
}
