import 'package:json_annotation/json_annotation.dart';

enum AuthProviderType {
  @JsonValue('GOOGLE')
  GOOGLE,
  @JsonValue('APPLE')
  APPLE,
  NONE,
}