import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/presentation/widgets/default_layout.dart';
import 'package:potato_4cut_v2/presentation/widgets/filter.dart';
import 'package:potato_4cut_v2/presentation/views/gallery/widgets/gallery_frame_list.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: Row(
        children: [
          Text(
            '갤러리',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          const Spacer(),
          const Filter(),
        ],
      ),
      body: const GalleryFrameList(),
    );
  }
}
