import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_user_details_controller.dart';

class ProfilePicture extends StatelessWidget {
  final controller = Get.find<AddDetailseController>();
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  final VoidCallback onTap;

  ProfilePicture({
    Key? key,
    this.height = 28,
    this.width = 28,
    this.borderRadius = 8 / 2,
    this.margin = const EdgeInsets.all(0.0),
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            child: Obx(() {
              return controller.selectedImagePath.value == ''
                  ? Image.network(
                      "https://www.pngitem.com/pimgs/m/581-5813504_avatar-dummy-png-transparent-png.png",
                      loadingBuilder: (context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    })
                  : Image.file(
                      File(controller.selectedImagePath.value),
                      fit: BoxFit.cover,
                    );
            }),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ));
  }
}
