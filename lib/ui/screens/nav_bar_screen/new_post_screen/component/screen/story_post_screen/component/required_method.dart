import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/app/controller/user_post_controller.dart';
import '../../../../../../../../generated/assets.dart';
import '../../../../../../../app_widgets/custom_action_button.dart';
import '../../../../../../../theme.dart';

StaggeredGridView staggeredGridView(List<String> allFiles,UserPostController userPostController) {
  return StaggeredGridView.countBuilder(
    crossAxisCount: 3,
    itemCount: allFiles.length,
    itemBuilder: (context, index) {
      var file = allFiles[index];
      return (index == 0)
          ? goToCameraScreenWidget(userPostController)
          : gridViewImageTile(file,userPostController);
    },
    staggeredTileBuilder: (index) => const StaggeredTile.count(1, 1.8),
    mainAxisSpacing: 2.0,
    crossAxisSpacing: 2.0,
  );
}

GestureDetector gridViewImageTile(String file, UserPostController userPostController) {
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
}

Container goToCameraScreenWidget(UserPostController userPostController) {
  return Container(
    color: const Color(0xFF1b1b1b),
    child: Stack(
      children: [
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: iconButtonWidget(
              function: () {
                userPostController.pageController.jumpTo(0);
              },
              iconPath: Assets.iconsIconCamera,
              color: AppColors.light,
            )),
        const Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            'Camera',
            style: TextStyle(
                color: AppColors.light,
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
  );
}