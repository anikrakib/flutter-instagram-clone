import 'package:get/get.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/new_post_screen/component/screen/user_post_screen/user_post_screen.dart';

class UserPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserPostScreen>(
      const UserPostScreen(),
    );
  }
}