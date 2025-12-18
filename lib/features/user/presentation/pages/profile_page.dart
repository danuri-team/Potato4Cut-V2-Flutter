import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/features/user/presentation/widgets/withdraw_and_logout.dart';
import 'package:potato_4cut_v2/features/user/presentation/widgets/setting_card_list.dart';
import 'package:potato_4cut_v2/features/user/presentation/widgets/user_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: Text(
        '프로필',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, height: 1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const UserProfile(),
            SizedBox(height: 36.h),
            const SettingCardList(),
            SizedBox(height: 42.h),
            const WithdrawAndLogout(),
          ],
        ),
      ),
    );
  }
}
