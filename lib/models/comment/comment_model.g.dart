// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      message: json['message'] as String? ?? "",
      publishedDateTime: json['publishedDateTime'] as int? ?? 0,
      totalLikes: json['totalLikes'] as int? ?? 0,
      userId: json['userId'] as String? ?? "",
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'message': instance.message,
      'publishedDateTime': instance.publishedDateTime,
      'totalLikes': instance.totalLikes,
      'userId': instance.userId,
    };
