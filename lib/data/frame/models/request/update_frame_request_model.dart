import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/update_frame_request_entity.dart';

part 'update_frame_request_model.g.dart';

@JsonSerializable()
class UpdateFrameRequestModel {
  final String frameBaseImageKey;
  final String frameOverlayImageKey;

  const UpdateFrameRequestModel(
    this.frameBaseImageKey,
    this.frameOverlayImageKey,
  );

  factory UpdateFrameRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateFrameRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFrameRequestModelToJson(this);

  UpdateFrameRequestEntity toEntity() {
    return UpdateFrameRequestEntity(frameBaseImageKey, frameOverlayImageKey);
  }
}
