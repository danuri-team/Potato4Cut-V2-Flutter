import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:potato_4cut_v2/core/constants/hive_keys.dart';
import 'package:potato_4cut_v2/core/enum/local_storage_event_type.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';
import 'package:potato_4cut_v2/features/home/presentation/widgets/make_frame_card.dart';
import 'package:potato_4cut_v2/features/home/presentation/widgets/take_photo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static bool _isDialogShowing = false;

  @override
  void initState() {
    super.initState();
    if (!_isDialogShowing) {
      _isDialogShowing = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkAndShowPermissionDialog();
      });
    }
  }

  Future<void> _checkAndShowPermissionDialog() async {
    final box = await Hive.openBox(LocalStorageEventType.SETTINGS.toString());
    final isShown = box.get(SettingsKeys.permissionShown, defaultValue: false);

    if (!isShown) {
      await _showPermissionRequestDialog();
      _isDialogShowing = false;
    }
  }

  Future<void> _showPermissionRequestDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("마케팅 수신 동의(정보/광고 알림)", style: AppTextStyle.headLine1),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "전송할 정보 및 광고의 내용",
                  style: AppTextStyle.body1Normal.copyWith(
                    color: AppColor.label3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "- 이벤트 프로모션 홍보\n- 기타 주요 공지\n- 혜택 안내",
                  style: AppTextStyle.label1Normal.copyWith(
                    color: AppColor.label3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "전송 방법",
                  style: AppTextStyle.body1Normal.copyWith(
                    color: AppColor.label3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "- 모바일 어플리케이션 푸시 메세지",
                  style: AppTextStyle.label1Normal.copyWith(
                    color: AppColor.label3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32.h),
                SubmitButton(
                  onTap: () {
                    Throttle.run(() {
                      _savePermissionChoice(true);
                      AppNavigation.pop(context);
                    });
                  },
                  width: 287.w,
                  text: "동의",
                  isActivate: true,
                ),
                SizedBox(height: 10.h),
                SubmitButton(
                  onTap: () {
                    Throttle.run(() {
                      _savePermissionChoice(false);
                      AppNavigation.pop(context);
                    });
                  },
                  width: 287.w,
                  text: "거부",
                  isActivate: true,
                  isAlternative: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _savePermissionChoice(bool isAccepted) async {
    final box = await Hive.openBox(LocalStorageEventType.SETTINGS.toString());

    await box.put(SettingsKeys.permissionShown, true);
    await box.put(SettingsKeys.permissionAccepted, isAccepted);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('감자네컷', style: AppTextStyle.logoText.copyWith(fontSize: 24.sp)),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/images/bell.svg'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const TakePhotoCard(),
            SizedBox(height: 20.h),
            const MakeFrameCard(),
          ],
        ),
      ),
    );
  }
}
