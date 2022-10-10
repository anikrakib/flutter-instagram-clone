import 'package:get/get.dart';
import 'package:instagram_clone/app/controller/signin_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
          () => SignInController(),
    );
  }
}
