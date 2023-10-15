// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoModelImpl _$$VideoModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoModelImpl(
      userId: json['userId'] as String? ?? "",
      userName: json['userName'] as String? ?? "",
      userProfileImage: json['userProfileImage'] as String? ?? "",
      videoId: json['videoId'] as String? ?? "",
      totalComments: json['totalComments'] as int? ?? 0,
      totalShares: json['totalShares'] as int? ?? 0,
      totalLikes: json['totalLikes'] as int? ?? 0,
      artistSongName: json['artistSongName'] as String? ?? "",
      descriptionTags: json['descriptionTags'] as String? ?? "",
      videoUrl: json['videoUrl'] as String? ?? "",
      thumbnailUrl: json['thumbnailUrl'] as String? ?? "",
      publishedDateTime: json['publishedDateTime'] as int? ?? 0,
    );

Map<String, dynamic> _$$VideoModelImplToJson(_$VideoModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userProfileImage': instance.userProfileImage,
      'videoId': instance.videoId,
      'totalComments': instance.totalComments,
      'totalShares': instance.totalShares,
      'totalLikes': instance.totalLikes,
      'artistSongName': instance.artistSongName,
      'descriptionTags': instance.descriptionTags,
      'videoUrl': instance.videoUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'publishedDateTime': instance.publishedDateTime,
    };
