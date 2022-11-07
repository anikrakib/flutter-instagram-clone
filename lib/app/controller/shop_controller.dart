import 'package:get/get.dart';

class ShopController extends GetxController {
  final visibleTitle = false.obs;

  updateTitleVisibility(bool value) {
    visibleTitle.value = value;
  }
}
