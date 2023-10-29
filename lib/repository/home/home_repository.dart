import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';

class HomeRepository extends IHomeRepository {
  @override
  Future<List<VideoModel>> getVideoListFromFirestore() async {
    final querySnapshots =
        await FirebaseFirestore.instance.collection("videos").get();
    final videoModelList = querySnapshots.docs
        .map((doc) => VideoModel.fromDocumentSnapshot(doc))
        .toList();

    return videoModelList.reversed.toList();
  }
}
