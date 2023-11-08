import 'package:tiktok_clone/models/video/video_model.dart';

abstract class IProfileRepository {
  Future<List<VideoModel>> getVideoModelList(List<String> videoIdList);
  Future<VideoModel> getVideoModel(String videoId);
}
