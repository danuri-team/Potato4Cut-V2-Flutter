class UploadLinkResponseEntity {
  final bool success;
  final UploadLinkDataEntity data;
  final String message;

  const UploadLinkResponseEntity(this.success, this.data, this.message);
}

class UploadLinkDataEntity {
  final String uploadUrl;
  final String key;
  final String fileUrl;
  final String contentType;
  final int maxFileSize;

  const UploadLinkDataEntity(
    this.uploadUrl,
    this.key,
    this.fileUrl,
    this.contentType,
    this.maxFileSize,
  );
}
