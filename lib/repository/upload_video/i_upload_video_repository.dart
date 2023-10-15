abstract class IUploadVideoRepository {
  Future<void> saveVideoInformationToFirestoreDatabase({
    required String artistSongName,
    required String descriptionTags,
    required String videoFilePath,
  });
}
