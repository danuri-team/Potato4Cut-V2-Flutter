class FrameUploadLinkResponseEntity {
  final bool success;
  final FrameUploadLinkDataEntity data;
  final String message;

  const FrameUploadLinkResponseEntity(this.success, this.data, this.message);
}

class FrameUploadLinkDataEntity {
  final String uploadUrl;
  final String key;
  final String fileUrl;
  final String contentType;
  final int maxFileSize;

  const FrameUploadLinkDataEntity(
    this.uploadUrl,
    this.key,
    this.fileUrl,
    this.contentType,
    this.maxFileSize,
  );
}
