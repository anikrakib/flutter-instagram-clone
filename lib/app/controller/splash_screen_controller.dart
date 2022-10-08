import 'package:get/get.dart';
import 'package:instagram_clone/routes/app_routes.dart';

class SplashScreenController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offAllNamed(Routes.EXISTINGACCOUNT);
    });
  }

}