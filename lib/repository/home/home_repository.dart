import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  @override
  Future<List<VideoModel>> getVideoListFromFirestore() async {
    final querySnapshots = await FirebaseFirestore.instance
        .collection("videos")
        .orderBy("publishedDateTime", descending: true)
        .get();

    final videoModelList = querySnapshots.docs
        .map((doc) => VideoModel.fromDocumentSnapshot(doc))
        .toList();

    return videoModelList;
  }
}
