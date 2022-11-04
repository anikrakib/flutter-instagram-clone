import 'package:get/get.dart';
import '../model/file_model.dart';

class UserPostController extends GetxController {
  final image = ''.obs;
  final expandedOrNot = false.obs;
  final hideImagePreview = false.obs;
  final selectedModel = FileModel().obs;

  updateImage(String value) {
    image.value = value;
  }

  changeExpandedOrNot(bool value) {
    expandedOrNot.value = value;
  }

  changeHideImagePreview(bool value) {
    hideImagePreview.value = value;
  }

  updateSelectModel(FileModel fileModel) {
    selectedModel.value = fileModel;
  }
}
