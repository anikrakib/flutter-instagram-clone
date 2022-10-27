import 'package:flutter/material.dart';
import '../../../../../app/model/user_model.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/constants.dart';
import '../../../../app_widgets/app_image.dart';
import '../../../../app_widgets/sizeBox.dart';
import '../../../../theme.dart';

Padding othersUserStory(BuildContext context, User user) {
  return Padding(
    padding: const EdgeInsets.only(right: defaultPadding * .8),
    child: Column(
      children: [
        userMyDayProfileImage(
          context: context,
          myDayProfilePicSize: myDayProfilePicSize + 10,
          padding: myDayPadding,
          imageUrl: user.profileImageUrl,
        ),
        sizeBox(8),
        Text(
          user.userName.length > 13
              ? '${user.userName.substring(0, 10)}...'
              : user.userName,
          style: AppTextStyle.textStyleSmall,
        ),
      ],
    ),
  );
}

Padding yourStory(BuildContext context, String userImage) {
  return Padding(
    padding:
        const EdgeInsets.only(left: defaultPadding, right: defaultPadding * .8),
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
        sizeBox(15),
        const Text(
          'Your Story',
          style: AppTextStyle.textStyleSmall,
        )
      ],
    ),
  );
}

Widget userMyDayProfileImage({
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
        Positioned(
          top: 1,
          bottom: 1,
          right: 1,
          left: 1,
          child: svgImage(
            Assets.assetsMyDayBackground,
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
