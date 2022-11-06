import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/file_model.dart';

class UserPostController extends GetxController {
  late PageController pageController;

  final image = ''.obs;
  final expandedOrNot = false.obs;
  final showAddToStoryPage = true.obs;
  final hideImagePreview = false.obs;
  final selectedModel = FileModel().obs;
  final listWheelPosition = 0.0.obs;
  final diameterRatio = 5.0.obs;
  final currentIndex = 0.obs;
  final pageViewIndex = 0.obs;
  final allImageList = ['custom_widget'].obs;
  final directStoryImagePage = true.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      initialPage: pageViewIndex.value
    );
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  changeDirectStoryImagePage(){
    directStoryImagePage.value = !(directStoryImagePage.value);
  }

  storeAllImage(List<String> images){
    allImageList.addAll(images);
  }

  updatePageViewIndex(int value){
    pageViewIndex.value = value;
  }

  updateShowAddToStoryPage(bool value){
    showAddToStoryPage.value = value;
  }

  updateIndex(int value){
    currentIndex.value = value;
  }
  updateListWheelPosition(double value) {
    listWheelPosition.value = value;
  }

  updateDiameterRatio(double value) {
    diameterRatio.value = value;
  }

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
