// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'possession_products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PossessionProductsResponseModel _$PossessionProductsResponseModelFromJson(
  Map<String, dynamic> json,
) => PossessionProductsResponseModel(
  json['success'] as bool,
  PossessionProductsDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PossessionProductsResponseModelToJson(
  PossessionProductsResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

PossessionProductsDataModel _$PossessionProductsDataModelFromJson(
  Map<String, dynamic> json,
) => PossessionProductsDataModel(
  (json['content'] as List<dynamic>)
      .map((e) => LibraryFrameDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['currentPage'] as num).toInt(),
  (json['pageSize'] as num).toInt(),
  (json['totalElements'] as num).toInt(),
  (json['totalPages'] as num).toInt(),
  json['first'] as bool,
  json['last'] as bool,
  json['hasNext'] as bool,
  json['hasPrevious'] as bool,
);

Map<String, dynamic> _$PossessionProductsDataModelToJson(
  PossessionProductsDataModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'currentPage': instance.currentPage,
  'pageSize': instance.pageSize,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'last': instance.last,
  'hasNext': instance.hasNext,
  'hasPrevious': instance.hasPrevious,
};
