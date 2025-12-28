class UserPhotosResponseEntity {
  final bool success;
  final UserPhotosDataEntity data;

  const UserPhotosResponseEntity(this.success, this.data);
}

class UserPhotosDataEntity {
  final List<UserPhotoEntity> content;
  final int currentPage;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
  final bool hasNext;
  final bool hasPrevious;

  const UserPhotosDataEntity(
    this.content,
    this.currentPage,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
    this.hasNext,
    this.hasPrevious,
  );
}

class UserPhotoEntity {
  final String id;
  final String imageUrl;
  final String frameId;
  final DateTime createdAt;

  const UserPhotoEntity(
    this.id,
    this.imageUrl,
    this.frameId,
    this.createdAt,
  );
}
