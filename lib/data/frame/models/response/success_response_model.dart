import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/success_response_entity.dart';

part 'success_response_model.g.dart';

@JsonSerializable()
class SuccessResponseModel {
  final bool success;

  const SuccessResponseModel(this.success);

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) => _$SuccessResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessResponseModelToJson(this);

  SuccessResponseEntity toEntity(){
    return SuccessResponseEntity(success);
  }
}