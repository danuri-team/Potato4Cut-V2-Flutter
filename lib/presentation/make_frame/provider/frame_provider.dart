import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/data/make_frame/data_sources/frame_data_source.dart';
import 'package:potato_4cut_v2/data/make_frame/data_sources/frame_data_source_impl.dart';
import 'package:potato_4cut_v2/data/make_frame/repositories/frame_repository_impl.dart';
import 'package:potato_4cut_v2/domain/make_frame/repositories/frame_repository.dart';
import 'package:potato_4cut_v2/domain/make_frame/usecases/create_frame_use_case.dart';
import 'package:potato_4cut_v2/domain/make_frame/usecases/frame_use_cases.dart';
import 'package:potato_4cut_v2/domain/make_frame/usecases/issue_frame_upload_link_use_case.dart';
import 'package:potato_4cut_v2/domain/make_frame/usecases/issue_preview_upload_link_use_case.dart';
import 'package:potato_4cut_v2/domain/make_frame/usecases/upload_file_to_s3_use_case.dart';

final frameDataSourceProvider = Provider<FrameDataSource>((ref) {
  return FrameDataSourceImpl(null);
});

final frameRepositoryProvider = Provider<FrameRepository>((ref) {
  return FrameRepositoryImpl(dataSource: ref.read(frameDataSourceProvider));
});

final issueFrameUploadLinkUseCaseProvider = Provider<IssueFrameUploadLinkUseCase>((ref) {
  return IssueFrameUploadLinkUseCase(ref.read(frameRepositoryProvider));
});

final issuePreviewUploadLinkUseCaseProvider = Provider<IssuePreviewUploadLinkUseCase>((ref) {
  return IssuePreviewUploadLinkUseCase(ref.read(frameRepositoryProvider));
});

final createFrameUseCaseProvider = Provider<CreateFrameUseCase>((ref) {
  return CreateFrameUseCase(ref.read(frameRepositoryProvider));
});

final uploadFileToS3UseCaseProvider = Provider<UploadFileToS3UseCase>((ref) {
  return UploadFileToS3UseCase(ref.read(frameRepositoryProvider));
});

final frameUseCasesProvider = Provider<FrameUseCases>((ref) {
  return FrameUseCases(
    issueFrameUploadLink: ref.read(issueFrameUploadLinkUseCaseProvider),
    issuePreviewUploadLink: ref.read(issuePreviewUploadLinkUseCaseProvider),
    createFrame: ref.read(createFrameUseCaseProvider),
    uploadFileToS3: ref.read(uploadFileToS3UseCaseProvider),
  );
});
