class Save4cutPhotosResponseEntity {
  final bool success;
  final Save4cutPhotosDataEntity data;
  final String message;

  const Save4cutPhotosResponseEntity(this.success, this.data, this.message);
}

class Save4cutPhotosDataEntity {
  final String photoId;
  final String composedImageUrl;
  String? frameId;
  String? frameTitle;

  Save4cutPhotosDataEntity(
    this.photoId,
    this.composedImageUrl,
    this.frameId,
    this.frameTitle,
  );
}
