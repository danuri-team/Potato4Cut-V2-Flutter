import 'dart:typed_data';

import 'package:potato_4cut_v2/core/enum/photo_share_type.dart';
import 'package:potato_4cut_v2/domain/common/entities/request/issue_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/domain/photos/entites/request/save_4cut_photos_request_entity.dart';
import 'package:potato_4cut_v2/domain/photos/repositories/photo_repository.dart';

class UploadPhotoUseCase {
  final PhotoRepository _repository;

  UploadPhotoUseCase(this._repository);

  Future<String> uploadPhotoAndSave({
    required Uint8List imageData,
    required String frameId,
    required PhotoShareType photoShareType,
    required String expireAt,
  }) async {
    // 1. 파일 크기 계산
    final fileSize = imageData.length;

    // 2. 업로드 링크 발급
    final uploadLinkResponse = await _repository.issue4CutUploadLink(
      IssueUploadLinkRequestEntity(fileSize.toString()),
    );

    // 3. S3에 업로드
    await _repository.uploadToS3(uploadLinkResponse.data.uploadUrl, imageData);

    // 4. 서버에 저장 정보 전송
    await _repository.save4CutPhotos(
      Save4cutPhotosRequestEntity(
        frameId,
        uploadLinkResponse.data.key,
        photoShareType,
        expireAt,
      ),
    );

    return uploadLinkResponse.data.key;
  }
}
