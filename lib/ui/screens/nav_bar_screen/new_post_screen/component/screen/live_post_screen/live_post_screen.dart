import 'package:flutter/material.dart';
import '../../../../../../../generated/assets.dart';
import '../../../../../../../utils/constants.dart';
import '../../../../../../app_widgets/custom_camera.dart';
import '../../../../../../app_widgets/widgets.dart';
import '../../../../../../theme.dart';

class LivePostScreen extends StatelessWidget {
  const LivePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: Stack(
        children: [
          CameraScreen(isLiveStream: true,),
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
                    buildFeaturesRow(path: Assets.iconsIconLiveMenu,text: 'Title'),
                    sizeBox(defaultPadding),
                    buildFeaturesRow(path: Assets.iconsIconHalfEye,text: 'Audience'),
                    sizeBox(defaultPadding),
                    buildFeaturesRow(path: Assets.iconsIconCalender,text: 'Schedule'),
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
