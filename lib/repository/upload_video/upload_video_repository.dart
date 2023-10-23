import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/upload_video/i_upload_video_repository.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoRepository implements IUploadVideoRepository {
  @override
  Future<void> saveVideoInformationToFirestoreDatabase({
    required String artistSongName,
    required String descriptionTags,
    required String videoFilePath,
  }) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    final userData = documentSnapshot.data() as Map<String, dynamic>;

    String videoId = DateTime.now().millisecondsSinceEpoch.toString();

    final videoDownloadUrl = await _uploadCompressedVideoFileToFirebaseStorage(
        videoId, videoFilePath);
    final thumbnailDownloadUrl =
        await _uploadThumbnailImageFileToFirebaseStorage(
            videoId, videoFilePath);

    final VideoModel videoModel = VideoModel(
      artistSongName: artistSongName,
      descriptionTags: descriptionTags,
      videoId: videoId,
      videoUrl: videoDownloadUrl,
      userName: userData["userName"],
      userId: userData["id"],
      thumbnailUrl: thumbnailDownloadUrl,
      totalComments: 0,
      totalLikes: 0,
      totalShares: 0,
      userProfileImage: userData["image"],
      publishedDateTime: DateTime.now().millisecondsSinceEpoch,
    );

    await FirebaseFirestore.instance
        .collection("videos")
        .doc(videoId)
        .set(videoModel.toJson());
  }

  Future<String> _uploadCompressedVideoFileToFirebaseStorage(
      String videoId, String videoFilePath) async {
    final compressedVideo = await _compressVideoFile(videoFilePath);
    if (compressedVideo == null) {
      return "";
    }
    final videoUploadTask = FirebaseStorage.instance
        .ref()
        .child("All Videos")
        .child(videoId)
        .putFile(compressedVideo);

    final TaskSnapshot snapshot = await videoUploadTask;

    String downloadUrlOfUploadVideo = await snapshot.ref.getDownloadURL();

    return downloadUrlOfUploadVideo;
  }

  Future<String> _uploadThumbnailImageFileToFirebaseStorage(
      String videoId, String videoFilePath) async {
    final thumbnailUploadTask = FirebaseStorage.instance
        .ref()
        .child("All Thumbnails")
        .child(videoId)
        .putFile(await _getThumbnailImage(videoFilePath));

    final TaskSnapshot snapshot = await thumbnailUploadTask;

    String downloadUrlOfUploadedThumbnail = await snapshot.ref.getDownloadURL();

    return downloadUrlOfUploadedThumbnail;
  }

  Future<File?> _compressVideoFile(String videoFilePath) async {
    final compressVideo = await VideoCompress.compressVideo(videoFilePath,
        quality: VideoQuality.LowQuality);
    return compressVideo!.file;
  }

  Future<File> _getThumbnailImage(String videoFilePath) async {
    return await VideoCompress.getFileThumbnail(videoFilePath);
  }
}
