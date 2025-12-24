import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/data/frame/models/response/comment_model.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/frame_comment_response_entity.dart';

part 'frame_comment_response_model.g.dart';

@JsonSerializable()
class FrameCommentResponseModel {
  final bool success;
  final FrameCommentDataModel data;

  const FrameCommentResponseModel(this.success, this.data);

  factory FrameCommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FrameCommentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FrameCommentResponseModelToJson(this);

  FrameCommentResponseEntity toEntity(){
    final data = this.data.toEntity();
    return FrameCommentResponseEntity(success, data);
  }
}

@JsonSerializable()
class FrameCommentDataModel {
  final List<CommentModel> content;
  final int currentPage;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
  final bool hasNext;
  final bool hasPrevious;

  const FrameCommentDataModel(
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

  factory FrameCommentDataModel.fromJson(Map<String, dynamic> json) =>
      _$FrameCommentDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FrameCommentDataModelToJson(this);

  FrameCommentDataEntity toEntity() {
    final content = List.generate(
      this.content.length,
      (index) => this.content[index].toEntity(),
    );
    return FrameCommentDataEntity(
      content,
      currentPage,
      pageSize,
      totalElements,
      totalPages,
      first,
      last,
      hasNext,
      hasPrevious,
    );
  }
}
