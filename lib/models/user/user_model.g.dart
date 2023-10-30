// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      userName: json['userName'] as String? ?? "",
      bio: json['bio'] as String? ?? "",
      email: json['email'] as String? ?? "",
      image: json['image'] as String? ?? "",
      totalFollowing: json['totalFollowing'] as int? ?? 0,
      totalFollowers: json['totalFollowers'] as int? ?? 0,
      totalLikes: json['totalLikes'] as int? ?? 0,
      videosIdList: json['videosIdList'] as List<dynamic>? ?? const [],
      favoriteVideosIdList:
          json['favoriteVideosIdList'] as List<dynamic>? ?? const [],
      youtubeLink: json['youtubeLink'] as String? ?? "",
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userName': instance.userName,
      'bio': instance.bio,
      'email': instance.email,
      'image': instance.image,
      'totalFollowing': instance.totalFollowing,
      'totalFollowers': instance.totalFollowers,
      'totalLikes': instance.totalLikes,
      'videosIdList': instance.videosIdList,
      'favoriteVideosIdList': instance.favoriteVideosIdList,
      'youtubeLink': instance.youtubeLink,
    };
