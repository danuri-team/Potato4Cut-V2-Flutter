import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/theme/app_text_style.dart';
import 'package:potato_4cut_v2/presentation/gallery/providers/maded_frame_provider.dart';

class MadedFrameList extends ConsumerStatefulWidget {
  const MadedFrameList({super.key});

  @override
  ConsumerState<MadedFrameList> createState() => _MadedFrameListState();
}

class _MadedFrameListState extends ConsumerState<MadedFrameList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(madedFrameProvider.notifier).fetchMadedFrames();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(madedFrameProvider);

    return switch (state.status) {
      MadedFrameStatus.loading => const Center(
        child: CupertinoActivityIndicator(),
      ),
      MadedFrameStatus.error => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('제작한 프레임이 없어요', style: AppTextStyle.body1Reading),
            SizedBox(height: 16.h),
            CupertinoButton(
              onPressed: () {
                ref.read(madedFrameProvider.notifier).fetchMadedFrames();
              },
              child: const Text('다시 시도'),
            ),
          ],
        ),
      ),
      MadedFrameStatus.success =>
        state.frames.isEmpty
            ? const SizedBox.shrink()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 28.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 105.w / 178.h,
                ),
                itemCount: state.frames.length,
                itemBuilder: (context, index) {
                  final frame = state.frames[index];
                  return SizedBox(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 154.h,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(frame.previewImageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          frame.title,
                          style: TextStyle(fontSize: 12.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
    };
  }
}
