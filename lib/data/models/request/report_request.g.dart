// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportRequest _$ReportRequestFromJson(Map<String, dynamic> json) =>
    ReportRequest(
      type: $enumDecode(_$ReportSubjectEnumMap, json['type']),
      targetId: json['targetId'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$ReportRequestToJson(ReportRequest instance) =>
    <String, dynamic>{
      'type': _$ReportSubjectEnumMap[instance.type]!,
      'targetId': instance.targetId,
      'reason': instance.reason,
    };

const _$ReportSubjectEnumMap = {ReportSubject.USER: 'USER'};
