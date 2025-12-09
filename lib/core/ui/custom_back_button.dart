import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potato_4cut_v2/core/router/router_helper.dart';
import 'package:potato_4cut_v2/core/util/throttle.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Throttle.run(() {
          AppNavigation.pop(context);
          onTap?.call();
        });
      },
      child: SvgPicture.asset('assets/images/chevron_left.svg'),
    );
  }
}
