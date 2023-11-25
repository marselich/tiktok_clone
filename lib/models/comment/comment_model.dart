import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const CommentModel._();
  factory CommentModel({
    @Default("") String id,
    @Default("") String name,
    @Default("") String imageUrl,
    @Default("") String message,
    @Default(0) int publishedDateTime,
    @Default(0) int totalLikes,
    @Default("") String userId,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  static CommentModel fromSnap(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CommentModel(
      id: data["id"],
      name: data["name"],
      imageUrl: data["imageUrl"],
      message: data["message"],
      publishedDateTime: data["publishedDateTime"],
      totalLikes: data["totalLikes"],
      userId: data["userId"],
    );
  }
}
