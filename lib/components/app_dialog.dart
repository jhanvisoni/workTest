import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static final _cupertinoTitleTextStyle =
      Get.textTheme.headline6?.copyWith(color: Colors.black);
  static final _cupertinoDescriptionTextStyle =
      Get.textTheme.headline6?.copyWith(color: Colors.white);
  static final _cupertinoButtonTextStyle =
      Get.textTheme.headline6?.copyWith(color: Colors.white);

  static final _materialTitleTextStyle = Get.textTheme.headline6?.copyWith(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static final _materialDescriptionTextStyle =
      Get.textTheme.headline6?.copyWith(
    color: Colors.black,
  );

  static void showMeassageDialog({
    String title = 'Message',
    String description = 'Something went wrong',
    String buttonText = 'Close',
    VoidCallback? onPressed,
    bool barrierDismissible = false,
  }) {
    if (Platform.isIOS) {
      Get.dialog(
        WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: CupertinoAlertDialog(
            title: Text(
              title,
              style: _cupertinoTitleTextStyle,
            ),
            content: Text(
              description,
              style: _cupertinoDescriptionTextStyle,
            ),
            actions: [
              CupertinoButton(
                onPressed: onPressed ??
                    () {
                      Get.back();
                    },
                child: Text(
                  buttonText,
                  style: _cupertinoButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
        barrierDismissible: barrierDismissible,
      );
    } else {
      Get.dialog(
        WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: AlertDialog(
            title: Text(title),
            titleTextStyle: _materialTitleTextStyle,
            content: Text(description),
            contentTextStyle: _materialDescriptionTextStyle,
            actions: [
              TextButton(
                onPressed: onPressed ??
                    () {
                      Get.back();
                    },
                child: Text(
                  buttonText,
                ),
                style: TextButton.styleFrom(
                    textStyle:
                        Get.textTheme.headline6?.copyWith(color: Colors.blue)),
              ),
            ],
          ),
        ),
        barrierDismissible: barrierDismissible,
      );
    }
  }
}
