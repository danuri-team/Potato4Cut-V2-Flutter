import 'package:potato_4cut_v2/data/frame/models/request/update_frame_request_model.dart';

class UpdateFrameRequestEntity {
  final String frameBaseImageKey;
  final String frameOverlayImageKey;

  const UpdateFrameRequestEntity(
    this.frameBaseImageKey,
    this.frameOverlayImageKey,
  );

  UpdateFrameRequestModel toModel() {
    return UpdateFrameRequestModel(
      frameBaseImageKey,
      frameOverlayImageKey,
    );
  }
}