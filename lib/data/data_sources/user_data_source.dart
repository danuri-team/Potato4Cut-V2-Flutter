import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:potato_4cut_v2/core/network/dio.dart';
import 'package:potato_4cut_v2/data/models/request/google_login_request.dart';

class UserDataSource {
  final dio = AppDio.getInstance();

  Future googleLogin(GoogleLoginRequest request) async {
    await dio.post(
      '/api/v1/auth/login',
      data: request.toJson(),
    );
  }

  Future updateProfile(String nickname, String bio, File profileImage) async {
    final formData = FormData.fromMap({
      'data': jsonEncode({'nickname': nickname, 'bio': bio}),
      'profileImage': await MultipartFile.fromFile(profileImage.path),
    });
    await dio.put(
      'api/v1/users/me',
      data: formData,
      options: Options(
        headers: {'Authorization': '', 'Content-Type': 'multipart/form-data'},
      ),
    );
  }

  Future getMyInfo() async {
    final response = await dio.get(
      'api/v1/users/me',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }

  Future deleteAccount() async {
    await dio.delete(
      'api/v1/users/me',
      options: Options(headers: {'Authorization': ''}),
    );
  }

  Future getMyPhotos(int page, int size) async {
    final response = await dio.get(
      'api/v1/users/me/photos?page=$page&size=$size',
      options: Options(headers: {'Authorization': ''}),
    );
    return response;
  }
}
