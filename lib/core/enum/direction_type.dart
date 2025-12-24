import 'package:json_annotation/json_annotation.dart';

enum DirectionType {
  @JsonValue('DESC')
  DESC,
  @JsonValue('ASC')
  ASC,
}