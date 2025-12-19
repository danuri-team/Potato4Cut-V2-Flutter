import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/features/library/domain/entities/response/possession_products_response_entity.dart';

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
  final List content;
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
