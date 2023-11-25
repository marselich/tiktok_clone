import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_clone/models/comment/comment_model.dart';
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

  @override
  Future<List<CommentModel>> getCommentListFromFireStore(String videoId) async {
    final commentsSnap = await FirebaseFirestore.instance
        .collection("videos")
        .doc(videoId)
        .collection("comments")
        .orderBy("publishedDateTime", descending: true)
        .get();

    final commentsList = commentsSnap.docs
        .map(
          (doc) => CommentModel.fromSnap(doc),
        )
        .toList();

    return commentsList;
  }
}
