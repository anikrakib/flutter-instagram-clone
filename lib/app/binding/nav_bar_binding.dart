import 'package:get/get.dart';
import 'package:instagram_clone/app/controller/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );
  }
}
