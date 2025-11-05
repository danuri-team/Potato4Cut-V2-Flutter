import 'package:json_annotation/json_annotation.dart';
import 'package:potato_4cut_v2/core/enum/report_subject_type.dart';

part 'report_request.g.dart';

@JsonSerializable()
class ReportRequest {
  final ReportSubject type;
  final String targetId;
  final String reason;

  const ReportRequest({
    required this.type,
    required this.targetId,
    required this.reason,
  });

  factory ReportRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReportRequestToJson(this);
}