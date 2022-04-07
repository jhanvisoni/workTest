import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

/// TextField with icon custom widget
class AppEditTextWithIcon extends StatelessWidget {
  final String titleText;
  final String hintText;
  final TextInputType keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? iconPath;
  final InputDecoration? decoration;
  final VoidCallback? onIconPress;
  final bool readOnly;
  final bool isLoading;
  final double borderRadius;
  final Color borderColor;

  const AppEditTextWithIcon({
    Key? key,
    required this.titleText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.controller,
    this.iconPath,
    this.onIconPress,
    this.onChanged,
    this.readOnly = false,
    this.isLoading = false,
    this.borderRadius = 8 * 10,
    this.borderColor = Colors.grey,
    //required this.validator,
    this.decoration,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// h and w is the responsive height and width of screen
    /// sp is the responsive font size
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Text(
              titleText,
              style: Get.textTheme.headline4?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15.0.sp,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: 350.h,
            height: 50.h,
            child: Material(
              borderRadius: BorderRadius.circular(borderRadius),
              child: TextFormField(
                style: Get.textTheme.headline6
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
                readOnly: readOnly,
                controller: controller,
                keyboardType: keyboardType,
                maxLength: maxLength,
                inputFormatters: inputFormatters,
                onChanged: onChanged,
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(fontSize: 15.sp),
                    counterText: "",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 1.h,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: 1.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      splashRadius: 24,
                      color: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      icon: const Icon(Icons.arrow_circle_down_outlined),
                      onPressed: isLoading ? () {} : onIconPress,
                    )),
                //validator: validator,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// TextField custom widget
class AppEditText extends StatelessWidget {
  static final numberOnly = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  final String? titleText;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final ValueChanged<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool? readOnly;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  const AppEditText({
    Key? key,
    this.titleText,
    this.hintText,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.decoration,
    this.onChanged,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// h and w is the responsive height and width of screen
    /// sp is the responsive font size
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 50.w).copyWith(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.w,
              horizontal: 8.h,
            ),
            child: Text(
              titleText!,
              style: Get.textTheme.headline4?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15.0.sp,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            child: TextFormField(
              style: Get.textTheme.headline6
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
              controller: controller,
              keyboardType: keyboardType,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              readOnly: readOnly!,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: hintText,
                counterText: "",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 32.w,
                  vertical: 8.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80.r),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80.r),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80.r),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80.r),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              //validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
