import 'package:potato_4cut_v2/domain/make_frame/usecases/create_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/make_frame/usecases/issue_frame_upload_link_use_case.dart';
import 'package:potato_4cut_v2/domain/make_frame/usecases/issue_preview_upload_link_use_case.dart';
import 'package:potato_4cut_v2/domain/make_frame/usecases/upload_file_to_s3_use_case.dart';

class FrameUseCases {
  final IssueFrameUploadLinkUseCase issueFrameUploadLink;
  final IssuePreviewUploadLinkUseCase issuePreviewUploadLink;
  final CreateFrameUseCase createFrame;
  final UploadFileToS3UseCase uploadFileToS3;

  FrameUseCases({
    required this.issueFrameUploadLink,
    required this.issuePreviewUploadLink,
    required this.createFrame,
    required this.uploadFileToS3,
  });
}
