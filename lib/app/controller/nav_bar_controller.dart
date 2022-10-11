import 'package:get/get.dart';

class NavBarController extends GetxController {
  final index = 0.obs;

  updateIndex(int value) {
    index.value = value;
  }
}
