import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';

Random random = Random();

Padding postHeader(String name, bool addOrPost, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      left: defaultPadding,
      right: defaultPadding,
      top: defaultPadding * .8,
      bottom: defaultPadding * .8,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            postHeaderImage(
              imageUrl:
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
