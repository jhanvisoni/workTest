import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:worktask/screens/user_details_view.dart';

import '../controller/user_list_controller.dart';
import 'add_details_page.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// h and w is the responsive height and width of screen
    /// sp is the responsive font size

    /// Profile controller initialization
    final controller = Get.put(UsersController());

    return WillPopScope(
      onWillPop: () {
        if (!controller.isSubmitting.value) {
          Get.back(result: true);
          return Future.value(true);
        }
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                "USERS LIST",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {
                        Get.to(const AddDetailsPage());
                      },
                      child: const Text("Add Details"),
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: GetBuilder<UsersController>(
                init: UsersController(),
                builder: (data) {
                  return controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.black,
                        ))
                      : Column(
                          children: <Widget>[
                            Container(
                                color: Colors.grey.withOpacity(0.6),
                                child: controller.buildSearchBox()),
                            controller.searchResult.length != 0 ||
                                    controller.serach.text.isNotEmpty
                                ? controller.buildSearchResults()
                                : SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: buildUserList(context, controller),
                                  ),
                          ],
                        );
                },
              ),
            )),
      ),
    );
  }

  Widget buildUserList(BuildContext context, UsersController controller) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.userdataList.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const UserDetailPage(), arguments: {
                        "name": controller.userdataList[index].name,
                        "address": controller.userdataList[index].address,
                        "email": controller.userdataList[index].email,
                        "profilePic": controller.userdataList[index].profilePic,
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            child: Image.network(
                              controller.userdataList[index].profilePic!,
                              loadingBuilder: (context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(controller.userdataList[index].name!.tr)
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
