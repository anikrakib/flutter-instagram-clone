import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  final userInfo = GetStorage();

  @override
  void onReady() {
    super.onReady();
    if (userInfo.read('isLoggedIn') != null) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else if (userInfo.read('userName') == null) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.SIGNIN);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.EXISTINGACCOUNT);
      });
    }
  }
}
