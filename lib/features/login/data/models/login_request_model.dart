import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/auth_provider_type.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  final AuthProviderType provider;
  final String oauthToken;
  final String deviceToken;

  const LoginRequestModel({
    required this.provider,
    required this.oauthToken,
    required this.deviceToken,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
