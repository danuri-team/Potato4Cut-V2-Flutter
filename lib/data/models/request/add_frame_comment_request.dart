import 'package:json_annotation/json_annotation.dart';

part 'add_frame_comment_request.g.dart';

@JsonSerializable()
class AddFrameCommentRequest {
  final String content;
  final String parentConmment;

  const AddFrameCommentRequest({
    required this.content,
    required this.parentConmment,
  });

  factory AddFrameCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$AddFrameCommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddFrameCommentRequestToJson(this);
}
