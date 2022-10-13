import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../../../../generated/assets.dart';

Padding likeCommentBookmarkParts(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      left: defaultPadding,
      right: defaultPadding,
      top: defaultPadding,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            navigationSVGImage(context, Assets.bottomNavbarIconHeart),
            sizeBox(10),
            navigationSVGImage(context, Assets.iconsIconComment),
            sizeBox(10),
            navigationSVGImage(context, Assets.iconsIconMessage),
          ],
        ),
        navigationSVGImage(context, Assets.iconsIconBookmark),
      ],
    ),
  );
}