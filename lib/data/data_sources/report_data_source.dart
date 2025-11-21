import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/data/models/request/report_request.dart';

class ReportDataSource {
  final dio = AppDio.getInstance();

  Future report(ReportRequest request) async {
    await dio.post(
      '/api/v1/reports',
      data: request.toJson(),
      options: Options(headers: {'Authorization': ''}),
    );
  }
}
