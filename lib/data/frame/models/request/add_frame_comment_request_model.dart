import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/add_frame_comment_request_entity.dart';

part 'add_frame_comment_request_model.g.dart';

@JsonSerializable()
class AddFrameCommentRequestModel {
  final String content;
  final String parentComment;

  const AddFrameCommentRequestModel(this.content, this.parentComment);

  factory AddFrameCommentRequestModel.fromJson(Map<String, dynamic> json) => _$AddFrameCommentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddFrameCommentRequestModelToJson(this);

  AddFrameCommentRequestEntity toEntity(){
    return AddFrameCommentRequestEntity(content, parentComment);
  }
}
