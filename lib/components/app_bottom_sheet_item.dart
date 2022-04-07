import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomSheetItem extends StatelessWidget {
  final String text;
  final Color tileColor;
  final VoidCallback onTap;
  const BottomSheetItem({
    Key? key,
    required this.text,
    this.tileColor = Colors.grey,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// h and w is the responsive height and width of screen
    /// sp is the responsive font size
    return Material(
      color: tileColor.withOpacity(0.2),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 8.h,
        ),
        title: Text(
          text,
          style: Get.textTheme.headline6
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        onTap: onTap,
      ),
    );
  }
}
