import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/video/video_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  factory UserModel({
    @Default("") String id,
    @Default("") String name,
    @Default("") String userName,
    @Default("") String bio,
    @Default("") String email,
    @Default("") String image,
    @Default(0) int totalFollowing,
    @Default(0) int totalFollowers,
    @Default(0) int totalLikes,
    @Default([]) List videosIdList,
    @Default([]) List favoriteVideosIdList,
    @Default("") String youtubeLink,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static UserModel fromSnap(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      id: dataSnapshot["id"],
      name: dataSnapshot["name"],
      userName: dataSnapshot["userName"],
      email: dataSnapshot["email"],
      image: dataSnapshot["image"],
      totalFollowing: dataSnapshot["totalFollowing"],
      totalFollowers: dataSnapshot["totalFollowers"],
      totalLikes: dataSnapshot["totalLikes"],
      videosIdList: dataSnapshot["videosIdList"],
      favoriteVideosIdList: dataSnapshot["favoriteVideosIdList"],
      youtubeLink: dataSnapshot["youtubeLink"],
    );
  }
}
