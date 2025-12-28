import 'package:potato_4cut_v2/core/enum/photo_share_type.dart';

class Save4cutPhotosRequestEntity {
  final String frameId;
  final String objectKey;
  final PhotoShareType photoShareType;
  final String expireAt;

  const Save4cutPhotosRequestEntity(
    this.frameId,
    this.objectKey,
    this.photoShareType,
    this.expireAt,
  );
}
