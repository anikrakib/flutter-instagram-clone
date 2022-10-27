import 'package:flutter/material.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../app_widgets/app_image.dart';
import '../../../../../theme.dart';

AppBar commentsAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Comments',
      style: AppTextStyle.textStyleBold,
    ),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: navigationSVGImage(context, Assets.iconsIconBack),
          onPressed: () => Navigator.pop(context),
        );
      },
    ),
    actions: [
      IconButton(
        icon: navigationSVGImage(context, Assets.iconsIconMessage),
        onPressed: () => {},
      )
    ],
  );
}