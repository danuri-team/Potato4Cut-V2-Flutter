import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/selected_frame_provider.dart';

class SelectedFrame extends ConsumerWidget {
  const SelectedFrame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFrame = ref.read(selectedFrameProvider);
    return Container(
      width: 286.w,
      height: 472.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(selectedFrame!.frameBaseImageUrl),
        ),
      ),
    );
  }
}
