import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/custom_back_button.dart';
import 'package:potato_4cut_v2/core/ui/custom_text_field.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/labeled_checkbox.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/ui/tag_input_field.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/request/create_frame_request_entity.dart';
import 'package:potato_4cut_v2/domain/make_frame/entities/request/issue_frame_upload_link_request_entity.dart';
import 'package:potato_4cut_v2/presentation/make_frame/provider/frame_provider.dart';
import 'package:potato_4cut_v2/presentation/make_frame/provider/make_frame_state_provider.dart';

class MakeFrameStep2Page extends ConsumerStatefulWidget {
  const MakeFrameStep2Page({super.key});

  @override
  ConsumerState<MakeFrameStep2Page> createState() => _MakeFrameStep2PageState();
}

class _MakeFrameStep2PageState extends ConsumerState<MakeFrameStep2Page> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  List<String> _tags = [];
  bool _isCommercialAllowed = false;
  bool _isLoading = false;

  bool get _isFormValid {
    return _titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _tags.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_onFormChanged);
    _descriptionController.addListener(_onFormChanged);
    _priceController.text = '0';
  }

  void _onFormChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _submitFrame() async {
    if (!_isFormValid || _isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final state = ref.read(makeFrameStateProvider);
      final notifier = ref.read(makeFrameStateProvider.notifier);
      final useCases = ref.read(frameUseCasesProvider);

      final baseFrameBytes = await state.baseFrameFile!.readAsBytes();
      final baseFrameSize = baseFrameBytes.length.toString();

      final baseUploadLinkResponse = await useCases.issueFrameUploadLink.execute(
        IssueFrameUploadLinkRequestEntity(baseFrameSize),
      );

      await useCases.uploadFileToS3.execute(
        baseUploadLinkResponse.data.uploadUrl,
        baseFrameBytes,
        baseUploadLinkResponse.data.contentType,
      );
      notifier.setBaseFrameKey(baseUploadLinkResponse.data.key);

      String? overlayFrameKey;
      if (state.overlayFrameFile != null) {
        final overlayFrameBytes = await state.overlayFrameFile!.readAsBytes();
        final overlayFrameSize = overlayFrameBytes.length.toString();

        final overlayUploadLinkResponse = await useCases.issueFrameUploadLink.execute(
          IssueFrameUploadLinkRequestEntity(overlayFrameSize),
        );

        await useCases.uploadFileToS3.execute(
          overlayUploadLinkResponse.data.uploadUrl,
          overlayFrameBytes,
          overlayUploadLinkResponse.data.contentType,
        );
        overlayFrameKey = overlayUploadLinkResponse.data.key;
        notifier.setOverlayFrameKey(overlayFrameKey);
      }

      final previewUploadLinkResponse = await useCases.issuePreviewUploadLink.execute(
        IssueFrameUploadLinkRequestEntity(baseFrameSize),
      );

      await useCases.uploadFileToS3.execute(
        previewUploadLinkResponse.data.uploadUrl,
        baseFrameBytes,
        previewUploadLinkResponse.data.contentType,
      );
      notifier.setPreviewKey(previewUploadLinkResponse.data.key);

      final price = _isCommercialAllowed ? 0 : int.tryParse(_priceController.text) ?? 0;

      final createFrameRequest = CreateFrameRequestEntity(
        title: _titleController.text,
        description: _descriptionController.text,
        isPublic: true,
        price: price,
        frameBaseImageKey: baseUploadLinkResponse.data.key,
        frameOverlayImageKey: overlayFrameKey,
        previewImageKey: previewUploadLinkResponse.data.key,
        category: 'CUTE',
        tags: _tags,
      );

      await useCases.createFrame.execute(createFrameRequest);

      notifier.setTitle(_titleController.text);
      notifier.setDescription(_descriptionController.text);
      notifier.setTags(_tags);
      notifier.setPrice(price);
      notifier.setIsFree(_isCommercialAllowed);

      if (mounted) {
        AppNavigation.goMakeFrameStep3(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('프레임 생성에 실패했습니다: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: CustomBackButton(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("나만의 프레임 만들기", style: AppTextStyle.headLine1),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: '제목',
                      hintText: '제목을 입력해주세요',
                      isRequired: true,
                      maxLength: 100,
                      controller: _titleController,
                    ),
                    SizedBox(height: 22.h),
                    CustomTextField(
                      label: '설명',
                      hintText: '설명을 입력해주세요',
                      isRequired: true,
                      maxLength: 2000,
                      maxLines: 3,
                      controller: _descriptionController,
                    ),
                    SizedBox(height: 22.h),
                    TagInputField(
                      label: '태그',
                      hintText: '태그를 입력해주세요',
                      isRequired: true,
                      tags: _tags,
                      onTagsChanged: (tags) {
                        setState(() {
                          _tags = tags;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledCheckbox(
            label: '판매 조건(상업적 사용 허용 여부 등)',
            value: _isCommercialAllowed,
            onChanged: (value) {
              setState(() {
                _isCommercialAllowed = value;
              });
            },
          ),
          SizedBox(height: 4.h),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
              child: SubmitButton(
                onTap: _submitFrame,
                width: double.infinity,
                text: _isLoading ? '처리 중...' : '다음으로',
                isActivate: _isFormValid && !_isLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
