class FourcutUploadLinkResponseEntity {
  final bool success;
  final FourcutUploadLinkDataEntity data;
  final String message;

  const FourcutUploadLinkResponseEntity(this.success, this.data, this.message);
}

class FourcutUploadLinkDataEntity {
  final String uploadUrl;
  final String key;
  final String fileUrl;
  final String contentType;
  final int maxFileSize;

  const FourcutUploadLinkDataEntity(
    this.uploadUrl,
    this.key,
    this.fileUrl,
    this.contentType,
    this.maxFileSize,
  );
}
