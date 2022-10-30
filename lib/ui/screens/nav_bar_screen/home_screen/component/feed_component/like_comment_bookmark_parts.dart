import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../../utils/utils_function.dart';

Padding likeCommentBookmarkParts(BuildContext context,
    [List<String>? images, int? activePage]) {
  return Padding(
    padding: const EdgeInsets.only(
      left: defaultPadding,
      right: defaultPadding,
      top: defaultPadding,
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                navigationSVGImage(context, Assets.bottomNavbarIconHeart),
                sizeBox(10),
                GestureDetector(
                    onTap: () => goTOAnotherPage(Routes.comments),
                    child:
                        navigationSVGImage(context, Assets.iconsIconComment)),
                sizeBox(10),
                navigationSVGImage(context, Assets.iconsIconMessage),
              ],
            ),
            navigationSVGImage(context, Assets.iconsIconBookmark),
          ],
        ),
        Visibility(
          visible: (images != null && images.length != 1) ? true : false,
          //visible: images != null && images.length != 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images?.length ?? 0, activePage),
          ),
        ),
      ],
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
          color: currentIndex == index ? AppColors.secondary : AppColors.faded,
          shape: BoxShape.circle),
    );
  });
}
