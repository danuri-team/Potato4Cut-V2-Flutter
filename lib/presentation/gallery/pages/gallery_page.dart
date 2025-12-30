import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/ui/default_layout.dart';
import 'package:potato_4cut_v2/presentation/gallery/widgets/maded_frame_list.dart';
import 'package:potato_4cut_v2/presentation/gallery/widgets/photo_taken_list.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String _selectedValue = '촬영한 네컷';
  bool _isDropdownOpen = false;
  final List<String> _items = ['촬영한 네컷', '제작한 프레임'];

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isDropdownOpen = !_isDropdownOpen;
              });
            },
            child: Row(
              children: [
                Text(
                  _selectedValue,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    height: 1,
                    color: CupertinoColors.label,
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(
                  _isDropdownOpen
                      ? CupertinoIcons.chevron_up
                      : CupertinoIcons.chevron_down,
                  size: 16.sp,
                  color: CupertinoColors.label,
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_isDropdownOpen) ...[
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Container(
                width: 150.w,
                color: CupertinoColors.systemBackground.resolveFrom(context),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _items.length,
                  separatorBuilder: (context, index) => SizedBox(height: 4.h),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    final isSelected = item == _selectedValue;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedValue = item;
                          _isDropdownOpen = false;
                        });
                      },
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: CupertinoColors.label,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 8.h),
          ],
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _selectedValue == '촬영한 네컷'
                  ? PhotoTakenList()
                  : MadedFrameList(),
            ),
          ),
        ],
      ),
    );
  }
}
