import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/controller/user_post_controller.dart';
import '../../../../../../../../app/model/file_model.dart';
import '../../../../../../../../generated/assets.dart';
import '../../../../../../../../utils/constants.dart';
import '../../../../../../../app_widgets/custom_action_button.dart';
import '../../../../../../../theme.dart';

AnimatedOpacity postImagePreviewSection(
  bool hideImagePreview,
  BuildContext context,
  double imagePreviewHeight,
  String image,
  bool expandedOrNot,
  UserPostController userPostController,
) {
  return AnimatedOpacity(
    duration: const Duration(milliseconds: 800),
    opacity: hideImagePreview ? 0 : 1,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 80),
      width: MediaQuery.of(context).size.width,
      height: hideImagePreview ? 0 : imagePreviewHeight,
      child: Container(
        color: Get.isDarkMode
            ? AppColors.postImagePreviewBackgroundDarkMode
            : AppColors.postImagePreviewBackgroundLightMode,
        child: Stack(
          children: [
            (image.isNotEmpty)
                ? Image.file(
                    File(image),
                    fit: expandedOrNot ? BoxFit.cover : null,
                    width: MediaQuery.of(context).size.width,
                  )
                : Container(
                    color: Get.isDarkMode
                        ? AppColors.postImagePreviewBackgroundDarkMode
                        : AppColors.postImagePreviewBackgroundLightMode,
                  ),
            Positioned(
              bottom: defaultPadding / 2,
              left: defaultPadding / 2,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF7d7c7d).withOpacity(0.5),
                ),
                child: iconButtonWidget(
                  function: () {
                    userPostController.changeExpandedOrNot(!expandedOrNot);
                  },
                  iconPath: Assets.iconsIconExpand,
                  color: AppColors.light,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

SizedBox imagesGridView(BuildContext context, FileModel selectedModel, ScrollController scrollController, UserPostController userPostController,) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.38,
    child: GridView.builder(
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (_, i) {
        var file = selectedModel.files[i];
        return GestureDetector(
          child: Image.file(
            File(file),
            fit: BoxFit.cover,
          ),
          onTap: () {
            userPostController.updateImage(file);
            userPostController.changeHideImagePreview(false);
          },
        );
      },
      itemCount: selectedModel.files.length,
    ),
  );
}