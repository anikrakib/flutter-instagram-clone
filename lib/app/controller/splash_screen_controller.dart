import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/routes/app_routes.dart';
import '../../utils/constants.dart';

class SplashScreenController extends GetxController {
  final userInfo = GetStorage();

  @override
  void onReady() {
    super.onReady();
    if (userInfo.read(isLoggedInKey) != null) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offAllNamed(Routes.navBarScreen);
      });
    } else if (userInfo.read(userNameKey) == null) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offAllNamed(Routes.signIn);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offAllNamed(Routes.existingAccount);
      });
    }
  }
}
