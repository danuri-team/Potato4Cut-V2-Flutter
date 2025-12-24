import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/data/library/models/response/library_frame_data_model.dart';
import 'package:potato_4cut_v2/domain/library/entities/response/possession_products_response_entity.dart';

part 'possession_products_response_model.g.dart';

@JsonSerializable()
class PossessionProductsResponseModel {
  final bool success;
  final PossessionProductsDataModel data;

  const PossessionProductsResponseModel(this.success, this.data);

  factory PossessionProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PossessionProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PossessionProductsResponseModelToJson(this);

  PossessionProductsResponseEntity toEntity() {
    final data = this.data.toEntity();
    return PossessionProductsResponseEntity(success, data);
  }
}

@JsonSerializable()
class PossessionProductsDataModel {
  final List<LibraryFrameDataModel> content;
  final int currentPage;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
  final bool hasNext;
  final bool hasPrevious;

  const PossessionProductsDataModel(
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

  factory PossessionProductsDataModel.fromJson(Map<String, dynamic> json) =>
      _$PossessionProductsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PossessionProductsDataModelToJson(this);

  PossessionProductsDataEntity toEntity() {
    final content = List.generate(this.content.length, (index) => this.content[index].toEntity(),);
    return PossessionProductsDataEntity(
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
