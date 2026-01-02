import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/presentation/photo/providers/frame_base_image_url_provider.dart';

class SelectedFrame extends ConsumerWidget {
  const SelectedFrame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final framePreviewImageUrl = ref.watch(framePreviewImageUrlProvider);
    return Container(
      width: 286.w,
      height: 472.h,
      decoration: BoxDecoration(
        image: framePreviewImageUrl != null
            ? DecorationImage(
                image: NetworkImage(framePreviewImageUrl),
                fit: BoxFit.contain,
              )
            : null,
      ),
    );
  }
}
