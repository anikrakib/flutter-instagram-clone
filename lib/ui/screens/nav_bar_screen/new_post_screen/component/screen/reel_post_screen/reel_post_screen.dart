import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/app_widgets/custom_camera.dart';
import 'package:instagram_clone/ui/theme.dart';
import '../../../../../../../generated/assets.dart';
import '../../../../../../../utils/constants.dart';
import '../../../../../../app_widgets/widgets.dart';

class ReelPostScreen extends StatelessWidget {
  const ReelPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: Stack(
        children: [
          CameraScreen(isVideoCameraSelected: true,),
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
                    buildFeaturesRow(path: Assets.iconsIconMusic,text: 'Audio'),
                    sizeBox(defaultPadding),
                    buildFeaturesRow(path: Assets.iconsIconEffects,text: 'Effects'),
                    sizeBox(defaultPadding),
                    buildFeaturesRow(path: Assets.iconsIconCircle,text: 'Length'),
                    sizeBox(defaultPadding),
                    buildFeaturesRow(path: Assets.iconsIconSpeed, text: 'Speed',padding: 8.0),
                    sizeBox(defaultPadding),
                    buildFeaturesRow(path: Assets.iconsIconLayout, text: 'Video Layout'),
                    sizeBox(defaultPadding),
                    buildFeaturesRow(path: Assets.iconsIconClock, text: 'Timer'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
