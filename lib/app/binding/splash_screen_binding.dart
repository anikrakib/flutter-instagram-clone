import 'package:get/get.dart';
import 'package:instagram_clone/app/controller/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(
      SplashScreenController(),
    );
  }
}