import 'package:potato_4cut_v2/data/frame/data_source.dart/frame_data_source.dart';
import 'package:potato_4cut_v2/domain/frame/entities/request/add_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/detailed_frame_response_entity.dart';
import 'package:potato_4cut_v2/domain/frame/repository/frame_repository.dart';

class FrameRepositoryImpl implements FrameRepository{
  final FrameDataSource _dataSource;

  const FrameRepositoryImpl(this._dataSource);

}