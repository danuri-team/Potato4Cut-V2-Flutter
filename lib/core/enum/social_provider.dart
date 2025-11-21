import 'package:json_annotation/json_annotation.dart';

enum SocialProvider{
  @JsonValue('GOOGLE')
  GOOGLE,
  @JsonValue('APPLE')
  APPLE,
}