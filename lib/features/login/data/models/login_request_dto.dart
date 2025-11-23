import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  final String provider;
  final String oauthToken;
  final String deviceToken;

  const LoginRequestDto({
    required this.provider,
    required this.oauthToken,
    required this.deviceToken,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}
