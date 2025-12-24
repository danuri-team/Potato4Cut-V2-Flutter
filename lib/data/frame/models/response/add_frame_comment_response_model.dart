import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/data/frame/models/response/comment_model.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/add_frame_comment_response_entity.dart';

part 'add_frame_comment_response_model.g.dart';

@JsonSerializable()
class AddFrameCommentResponseModel {
  final bool success;
  final CommentModel data;
  final String message;

  const AddFrameCommentResponseModel(this.success, this.data, this.message);

  factory AddFrameCommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddFrameCommentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddFrameCommentResponseModelToJson(this);

  AddFrameCommentResponseEntity toEntity(){
    final data = this.data.toEntity();
    return AddFrameCommentResponseEntity(success, data, message);
  }
}
