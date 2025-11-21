import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigation.pop(context),
      child: SvgPicture.asset('assets/images/chevron_left.svg'),
    );
  }
}
