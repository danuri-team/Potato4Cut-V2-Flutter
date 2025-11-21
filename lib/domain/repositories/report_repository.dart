import 'package:potato_4cut_v2/data/models/request/report_request.dart';

abstract class ReportRepository {
  Future report(ReportRequest request);
}