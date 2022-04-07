import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/user_details_controller.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// h and w is the responsive height and width of screen
    /// sp is the responsive font size

    /// Profile controller initialization
    final controller = Get.put(UserDetailsController());

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "USER DETAIL",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ClipRRect(
                      child: Image.network(
                        controller.profilePic.value,
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
                        },
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "Name ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(controller.name.value),
                const Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(controller.address.value),
                const Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(controller.email.value),
                const Divider(
                  color: Colors.grey,
                ),
              ],
            );
          })),
    );
  }
}
