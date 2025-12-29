import 'package:potato_4cut_v2/core/enum/photo_share_type.dart';

class Save4cutPhotosResponseEntity {
  final bool success;
  final Save4cutPhotosDataEntity data;
  final String message;

  const Save4cutPhotosResponseEntity(this.success, this.data, this.message);
}

class Save4cutPhotosDataEntity {
  final String photoId;
  final String composedImageUrl;
  final String frameId;
  final String frameTitle;
  final String shareExpireAt;
  final PhotoShareType shareType;
  String? shareCode;

  Save4cutPhotosDataEntity(
    this.photoId,
    this.composedImageUrl,
    this.frameId,
    this.frameTitle,
    this.shareExpireAt,
    this.shareType,
    this.shareCode,
  );
}
