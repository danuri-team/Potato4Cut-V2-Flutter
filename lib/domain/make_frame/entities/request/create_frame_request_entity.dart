class CreateFrameRequestEntity {
  final String title;
  final String description;
  final bool isPublic;
  final int price;
  final String frameBaseImageKey;
  final String? frameOverlayImageKey;
  final String previewImageKey;
  final String category;
  final List<String> tags;

  const CreateFrameRequestEntity({
    required this.title,
    required this.description,
    required this.isPublic,
    required this.price,
    required this.frameBaseImageKey,
    this.frameOverlayImageKey,
    required this.previewImageKey,
    required this.category,
    required this.tags,
  });
}
  