import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../app/controller/user_post_controller.dart';
import '../../../../../../../../generated/assets.dart';
import '../../../../../../../../utils/constants.dart';
import '../../../../../../../app_widgets/custom_camera.dart';
import '../../../../../../../app_widgets/widgets.dart';

class CameraSection extends StatelessWidget {
  CameraSection({Key? key,}) : super(key: key);

  final userPostController = Get.find<UserPostController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraScreen(),
        Positioned(
          left: defaultPadding,
          top: 0,
          bottom: 0,
          child: SizedBox(
            width: 250,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildFeaturesRow(path: Assets.iconsIconText, text: 'Create'),
                  sizeBox(defaultPadding),
                  buildFeaturesRow(
                      path: Assets.iconsIconBoomerang, text: 'Boomerang'),
                  sizeBox(defaultPadding),
                  buildFeaturesRow(
                      path: Assets.iconsIconLayout, text: 'Layout'),
                  sizeBox(defaultPadding),
                  buildFeaturesRow(
                      path: Assets.iconsIconArrowDown, padding: 8.0),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}