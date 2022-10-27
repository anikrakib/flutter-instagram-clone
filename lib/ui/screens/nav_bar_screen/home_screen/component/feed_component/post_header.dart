import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';

import '../user_story_design.dart';

Random random = Random();

Padding postHeader({
  String? imagePath,
  required String name,
  required bool addOrPost,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: defaultPadding,
      right: defaultPadding,
      top: defaultPadding * .5,
      bottom: defaultPadding * .5,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            userMyDayProfileImage(
              context: context,
              myDayProfilePicSize: myDayProfilePicSize - 20,
              padding: myDayPadding / 1.5,
              imageUrl: imagePath ??
                  'https://randomuser.me/api/portraits/women/${random.nextInt(100)}.jpg',
            ),
            sizeBox(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.textStyleSmall,
                ),
                Visibility(
                  visible: addOrPost,
                  child: const Text(
                    'Sponsored',
                    style: AppTextStyle.textStyleSmall,
                  ),
                ),
              ],
            ),
          ],
        ),
        navigationSVGImage(context, Assets.iconsIconOptionVertical),
      ],
    ),
  );
}
