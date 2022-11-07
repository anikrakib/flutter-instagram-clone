import 'package:get/get.dart';
import 'package:instagram_clone/app/controller/shop_controller.dart';

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopController>(
          () => ShopController(),
    );
  }
}
