import 'package:get/get.dart';

import '../controller/signin_controller.dart';
import '../controller/signup_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
    Get.lazyPut<SignInController>(
          () => SignInController(),
    );
  }
}
