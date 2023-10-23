import 'package:tiktok_clone/models/video/video_model.dart';

abstract class IHomeRepository {
  Future<List<VideoModel>> getVideoListFromFirestore();
}
