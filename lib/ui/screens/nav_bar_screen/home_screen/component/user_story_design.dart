import 'package:flutter/material.dart';
import '../../../../../app/model/user_model.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/constants.dart';
import '../../../../app_widgets/app_image.dart';
import '../../../../app_widgets/widgets.dart';

Padding othersUserStory(BuildContext context, User user) {
  return Padding(
    padding: const EdgeInsets.only(right: defaultPadding /1.6),
    child: Column(
      children: [
        userMyDayProfileImage(
          storyAvailable: user.stories.isNotEmpty,
          context: context,
          myDayProfilePicSize: myDayProfilePicSize + 15,
          padding: myDayPadding,
          imageUrl: user.profileImageUrl,
        ),
        sizeBox(8),
        Text(
          user.userName.length > 13
              ? '${user.userName.substring(0, 10)}...'
              : user.userName,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        ),
      ],
    ),
  );
}

Widget yourStory(BuildContext context, String userImage) {
  return Padding(
    padding:
        const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              height: myDayProfilePicSize,
              width: myDayProfilePicSize,
              child: profileCircleAvatar(
                context: context,
                imageUrl: userImage,
              ),
            ),
            Positioned(
              bottom: -2,
              right: -2,
              child: CircleAvatar(
                radius: 11,
                backgroundColor: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  // Border radius
                  child: svgImageWithHeightAndWidth(
                    18,
                    18,
                    Assets.iconsIconAddStory,
                  ),
                ),
              ),
            )
          ],
        ),
        sizeBox(18),
        const Text(
          'Your Story',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
        )
      ],
    ),
  );
}

Widget userMyDayProfileImage({
  bool storyAvailable = false,
  required BuildContext context,
  required double myDayProfilePicSize,
  required double padding,
  required String imageUrl,
}) {
  return SizedBox(
    height: myDayProfilePicSize,
    width: myDayProfilePicSize,
    child: Stack(
      children: [
        Visibility(
          visible: storyAvailable,
          child: Positioned(
            top: 1,
            bottom: 1,
            right: 1,
            left: 1,
            child: svgImage(
              Assets.assetsMyDayBackground,
            ),
          ),
        ),
        Positioned(
          top: padding,
          left: padding,
          right: padding,
          bottom: padding,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              shape: BoxShape.circle,
            ),
            child: postHeaderImage(imageUrl: imageUrl),
          ),
        ),
      ],
    ),
  );
}
