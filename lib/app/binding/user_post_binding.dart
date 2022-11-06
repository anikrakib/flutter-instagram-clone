import 'package:get/get.dart';
import '../controller/user_post_controller.dart';

class UserPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserPostController>(
      UserPostController(),
    );
  }
}