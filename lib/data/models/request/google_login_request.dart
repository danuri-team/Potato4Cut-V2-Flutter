import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/social_provider.dart';

part 'google_login_request.g.dart';

@JsonSerializable()
class GoogleLoginRequest {
  final SocialProvider provider;
  final String oauthToken;
  final String deviceToken;

  const GoogleLoginRequest({
    required this.provider,
    required this.oauthToken,
    required this.deviceToken,
  });

  factory GoogleLoginRequest.fromJson(Map<String, dynamic> json) => _$GoogleLoginRequestFromJson(json);

  Map<String, dynamic> toJson() =>_$GoogleLoginRequestToJson(this);
}