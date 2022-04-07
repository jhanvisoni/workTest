import 'package:get/get.dart';

class UserDetailsController extends GetxController {
  var name = ''.obs;
  var address = ''.obs;
  var email = ''.obs;
  var profilePic = ''.obs;

  @override
  void onInit() {
    super.onInit();
    name.value = Get.arguments['name'];
    address.value = Get.arguments['address'];
    email.value = Get.arguments['email'];
    profilePic.value = Get.arguments['profilePic'];
  }
}
