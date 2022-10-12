import 'package:flutter/material.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/constants.dart';
import '../../../../app_widgets/sizeBox.dart';
import '../../../../app_widgets/app_image.dart';

AppBar homeScreenAppBar(BuildContext context) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(
        top: defaultPadding,
        bottom: defaultPadding,
        left: defaultPadding / 2,
      ),
      child: appLogoForAppBar(context),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: navigationSVGImage(context, Assets.bottomNavbarIconHeart),
      ),
      //sizeBox(defaultPadding),
      IconButton(
        onPressed: () {},
        icon: navigationSVGImage(context, Assets.iconsIconMessage),
      ),
      sizeBox(
        defaultPadding / 2,
      ),
    ],
  );
}
