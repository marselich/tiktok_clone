import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  factory UserModel({
    @Default("") String id,
    @Default("") String nickname,
    @Default("") String email,
    @Default("") String image,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static UserModel fromSnap(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      id: dataSnapshot["id"],
      nickname: dataSnapshot["nickname"],
      email: dataSnapshot["email"],
      image: dataSnapshot["image"],
    );
  }
}
