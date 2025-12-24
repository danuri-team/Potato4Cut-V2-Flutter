import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/token_response_entity.dart';

part 'token_response_model.g.dart';

@JsonSerializable()
class TokenModel {
  final String accessToken;
  final String refreshToken;

  const TokenModel({required this.accessToken, required this.refreshToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenResponseEntity toEntity() {
    return TokenResponseEntity(accessToken, refreshToken);
  }
}

