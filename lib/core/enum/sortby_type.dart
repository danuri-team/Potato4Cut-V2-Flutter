import 'package:json_annotation/json_annotation.dart';

enum SortbyType {
  @JsonValue('addedAt')
  addedAt,
  @JsonValue('title')
  title,
}