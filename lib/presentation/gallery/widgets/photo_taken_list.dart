import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';
import 'package:potato_4cut_v2/presentation/gallery/providers/photo_taken_provider.dart';

class PhotoTakenList extends ConsumerStatefulWidget {
  const PhotoTakenList({super.key});

  @override
  ConsumerState<PhotoTakenList> createState() => _PhotoTakenListState();
}

class _PhotoTakenListState extends ConsumerState<PhotoTakenList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(photoTakenProvider.notifier).fetchPhotoTaken();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(photoTakenProvider);

    return switch (state.status) {
      PhotoTakenStatus.loading => const Center(
        child: CupertinoActivityIndicator(),
      ),
      PhotoTakenStatus.error => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('오류가 발생했습니다'),
            SizedBox(height: 8.h),
            Text(state.errorMessage ?? '알 수 없는 오류'),
            SizedBox(height: 16.h),
            CupertinoButton(
              onPressed: () {
                ref.read(photoTakenProvider.notifier).fetchPhotoTaken();
              },
              child: const Text('다시 시도'),
            ),
          ],
        ),
      ),
      PhotoTakenStatus.success =>
        state.photos.isEmpty
            ? const SizedBox.shrink()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.5.w,
                  mainAxisSpacing: 4.h,
                  childAspectRatio: 112.w / 140.h,
                ),
                itemCount: state.photos.length,
                itemBuilder: (context, index) {
                  final photo = state.photos[index];
                  return Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColor.line2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(photo.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
    };
  }
}
