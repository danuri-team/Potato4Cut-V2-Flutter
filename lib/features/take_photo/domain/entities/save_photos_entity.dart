class SavePhotosEntity {
  final bool success;
  final List<PhotoDataEntity> data;
  final String message;

  const SavePhotosEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}

class PhotoDataEntity {
  final String cutId;
  final int cutOrder;
  final String originalImageUrl;

  const PhotoDataEntity({
    required this.cutId,
    required this.cutOrder,
    required this.originalImageUrl,
  });
}
