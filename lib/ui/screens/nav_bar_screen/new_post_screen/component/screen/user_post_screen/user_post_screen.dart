import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/controller/user_post_controller.dart';
import '../../../../../../../app/model/file_model.dart';
import '../../../../../../../generated/assets.dart';
import '../../../../../../app_widgets/custom_action_button.dart';
import '../../../../../../theme.dart';
import 'component/custom_middle_widget.dart';
import 'component/required_method.dart';

class UserPostScreen extends StatefulWidget {
  const UserPostScreen({Key? key}) : super(key: key);

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  final userPostController = Get.find<UserPostController>();
  ScrollController scrollController = ScrollController();
  List<FileModel> files = [];
  List<String> allFiles = [];

  @override
  void initState() {
    super.initState();
    getImagesPath();
    //getAllImage();
    scrollController.addListener(() {
      userPostController.changeHideImagePreview(scrollController.offset > 80);
    });
  }

  getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath!) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (files.isNotEmpty) {
      userPostController.updateSelectModel(files[0]);
      userPostController.updateImage(files[0].files[0]);
      for (var element in files) {
        allFiles.addAll(element.files);
      }
      userPostController.storeAllImage(allFiles);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        leading: iconButtonWidget(
          function: () {
            Get.back();
          },
          iconPath: Assets.iconsIconCross,
          color: Theme.of(context).primaryColor,
        ),
        actions: [
          iconButtonWidget(
            function: () {},
            iconPath: Assets.iconsIconForward,
            color: AppColors.secondary,
          )
        ],
      ),
      body: SafeArea(
        child: Obx(
          () {
            bool hideImagePreview = userPostController.hideImagePreview.value;
            bool expandedOrNot = userPostController.expandedOrNot.value;
            String image = userPostController.image.value;
            FileModel selectedModel = userPostController.selectedModel.value;
            double imagePreviewHeight =
                MediaQuery.of(context).size.height * 0.45;

            return Column(
              children: [
                postImagePreviewSection(
                  hideImagePreview,
                  context,
                  imagePreviewHeight,
                  image,
                  expandedOrNot,
                  userPostController,
                ),
                CustomMiddleWidget(
                  selectedModel,
                  userPostController,
                  files,
                  context,
                ),
                (selectedModel.files.isEmpty)
                    ? Expanded(child: Container())
                    : Expanded(
                        child: imagesGridView(context, selectedModel,
                            scrollController, userPostController)),
              ],
            );
          },
        ),
      ),
    );
  }
}
