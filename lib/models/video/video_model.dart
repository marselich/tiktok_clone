import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  const VideoModel._();
  factory VideoModel({
    @Default("") String userId,
    @Default("") String userName,
    @Default("") String userProfileImage,
    @Default("") String videoId,
    @Default(0) int totalComments,
    @Default(0) int totalShares,
    @Default(0) int totalLikes,
    @Default("") String artistSongName,
    @Default("") String descriptionTags,
    @Default("") String videoUrl,
    @Default("") String thumbnailUrl,
    @Default(0) int publishedDateTime,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  static VideoModel fromDocumentSnapshot(DocumentSnapshot snapshot) {
    var docSnapshot = snapshot.data() as Map<String, dynamic>;

    return VideoModel(
      userId: docSnapshot["userId"],
      userName: docSnapshot["userName"],
      userProfileImage: docSnapshot["userProfileImage"],
      videoId: docSnapshot["videoId"],
      totalComments: docSnapshot["totalComments"],
      totalShares: docSnapshot["totalShares"],
      totalLikes: docSnapshot["totalLikes"],
      artistSongName: docSnapshot["artistSongName"],
      descriptionTags: docSnapshot["descriptionTags"],
      videoUrl: docSnapshot["videoUrl"],
      thumbnailUrl: docSnapshot["thumbnailUrl"],
      publishedDateTime: docSnapshot["publishedDateTime"],
    );
  }
}
