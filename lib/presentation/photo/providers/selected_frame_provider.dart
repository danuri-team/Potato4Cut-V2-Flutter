import 'package:flutter_riverpod/flutter_riverpod.dart';

class FrameModel {
  final String frameId;
  final String frameBaseImageUrl;
  // final String frameOverlayImageUrl;

  FrameModel(
    this.frameId,
    this.frameBaseImageUrl,
    // this.frameOverlayImageUrl
  );
}

final selectedFrameProvider = StateProvider<FrameModel?>((ref) => null);
