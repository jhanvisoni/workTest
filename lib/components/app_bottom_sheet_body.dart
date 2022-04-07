import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomSheetBody extends StatelessWidget {
  final String title;
  final VoidCallback? onExit;
  final double height;
  final Widget? content;
  final bool shrinkWrap;
  const BottomSheetBody({
    Key? key,
    this.title = 'this is title',
    required this.height,
    this.onExit,
    this.shrinkWrap = false,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// h and w is the responsive height and width of screen
    /// sp is the responsive font size
    return Material(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8 * 2),
        ),
      ),
      child: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5.h,
                width: 100.h,
                decoration: BoxDecoration(
                  color: const Color(0xffDBDBDB),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 10.w,
                ),
              ),
              SizedBox(height: Get.height * .6, child: content)
            ],
          ),
        ),
      ),
    );
  }
}
