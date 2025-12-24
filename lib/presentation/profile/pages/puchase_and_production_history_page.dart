import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/core/ui/submit_button.dart';
import 'package:potato_4cut_v2/presentation/profile/widgets/production_history.dart';
import 'package:potato_4cut_v2/presentation/profile/widgets/puchase_history.dart';

class PuchaseAndProductionHistoryPage extends StatelessWidget {
  const PuchaseAndProductionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: GestureDetector(
        child: SvgPicture.asset('assets/images/chevron_left.svg'),
      ),
      body: Column(
        children: [
          SizedBox(height: 19.h),
          const PuchaseHistory(),
          SizedBox(height: 36.h),
          const ProductionHistory(),
          const Spacer(),
          SubmitButton(
            onTap: () {},
            width: 343.w,
            text: '확인',
            isActivate: false,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
