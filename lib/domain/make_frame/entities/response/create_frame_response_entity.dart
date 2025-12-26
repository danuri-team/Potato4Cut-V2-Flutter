class CreateFrameResponseEntity {
  final bool success;
  final CreateFrameDataEntity data;
  final String message;

  const CreateFrameResponseEntity(this.success, this.data, this.message);
}

class CreateFrameDataEntity {
  final String frameId;
  final String title;
  final String description;
  final bool public;
  final int price;
  final String frameBaseImageUrl;
  final String? frameOverlayImageUrl;
  final String previewImageUrl;
  final String category;
  final List<String> tags;

  const CreateFrameDataEntity({
    required this.frameId,
    required this.title,
    required this.description,
    required this.public,
    required this.price,
    required this.frameBaseImageUrl,
    this.frameOverlayImageUrl,
    required this.previewImageUrl,
    required this.category,
    required this.tags,
  });
}
