import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_category.dart';
import 'package:potato_4cut_v2/data/models/request/add_frame_comment_request.dart';

class FrameDataSource {
  final dio = AppDio.getInstance();

  Future addFrame(
    String title,
    String description,
    FrameCategory category,
    List<String> tags,
    File frameImage,
    File previewImage,
  ) async {
    final formData = FormData.fromMap({
      'data': jsonEncode({
        'title': title,
        'description': description,
        'category': category.name,
        'tags': tags,
      }),
      'frameImage': await MultipartFile.fromFile(frameImage.path),
      'previewImage': await MultipartFile.fromFile(previewImage.path),
    });
    await dio.post(
      '/api/v1/frames',
      data: formData,
      options: Options(
        headers: {'Authorization': '', 'Content-Type': 'multipart/form-data'},
      ),
    );
  }

  Future getDetailedFrame(String frameUuid) async {
    final response = await dio.get(
      '/api/v1/frames/$frameUuid',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }

  Future updateFrame(
    String frameUuid,
    String title,
    String description,
    FrameCategory category,
    List<String> tags,
    File frameImage,
    File previewImage,
  ) async {
    final formData = FormData.fromMap({
      'data': jsonEncode({
        'title': title,
        'description': description,
        'category': category,
        'tags': tags,
      }),
      'frameImage': await MultipartFile.fromFile(frameImage.path),
      'previewImage': await MultipartFile.fromFile(previewImage.path),
    });
    await dio.put(
      '/api/v1/frames/$frameUuid',
      data: formData,
      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future deleteFrame(String frameUuid) async {
    await dio.delete(
      '/api/v1/frames/$frameUuid',
      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future getFrameProductList(
    bool category,
    int page,
    int size,
    var sortBy,
    DirectionType direction,
  ) async {
    final response = await dio.get(
      '/api/v1/frames?category=$category&page=$page&size=$size&storBy=$sortBy&direction=$direction',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }

  Future searchFrame(String keyword, int page, int size) async {
    final response = await dio.get(
      '/api/v1/frames/search?$keyword&page=$page&size=$size',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }

  Future getFrameByTag(String tag, int page, int size) async {
    final response = await dio.get(
      '/api/v1/frames/tags/$tag?page=$page&size=$size',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }

  Future getMyFrame() async {
    final response = await dio.get(
      '/api/v1/frames/my',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }

  Future likeItFrame(String frameUuid) async {
    await dio.post(
      '/api/v1/frames/$frameUuid/like',

      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future cancleLikeFrame(String frameUuid) async {
    await dio.delete(
      '/api/v1/frames/$frameUuid/like',
      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future getFrameComments(String frameUuid) async {
    await dio.get(
      '/api/v1/frames/$frameUuid/comments',
      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future addFrameComment(
    String frameUuid,
    AddFrameCommentRequest request,
  ) async {
    await dio.post(
      '/api/v1/frames/$frameUuid/comments',
      data: request.toJson(),
      options: Options(headers: {'Authorization': ''}),
    );
  }
}
