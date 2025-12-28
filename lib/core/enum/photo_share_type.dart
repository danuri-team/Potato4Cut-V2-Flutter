import 'package:json_annotation/json_annotation.dart';

enum PhotoShareType {
  @JsonValue('LINK')
  LINK,
  @JsonValue('PRIVATE')
  PRIVATE
}