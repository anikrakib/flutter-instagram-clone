import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/story_screen/individual_story_screen.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../../../../app/model/user_model.dart';
import '../user_story_design.dart';

Random random = Random();

Padding postHeader({
  User? user,
  String? imagePath,
  String? name,
  Color? verifiedIconColor,
  required bool addOrPost,
  required BuildContext context,
}) {
  User users = user ??
      User(
        userName: '',
        profileImageUrl:
            'https://randomuser.me/api/portraits/women/${random.nextInt(100)}.jpg',
        fullName: '',
        bio: '',
        stories: [],
        verified: false,
      );
  bool storyAvailable = user?.stories.isNotEmpty ?? false;
  return Padding(
    padding: const EdgeInsets.only(
      left: defaultPadding,
      right: defaultPadding,
      top: defaultPadding * .5,
      bottom: defaultPadding * .5,
    ),
    child: SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (storyAvailable) {
                Get.to(
                  IndividualStoryScreen(users: users),
                );
              }
            },
            child: userMyDayProfileImage(
              storyAvailable: storyAvailable,
              context: context,
              myDayProfilePicSize: myDayProfilePicSize - 20,
              padding: myDayPadding / 1.5,
              imageUrl: users.profileImageUrl,
            ),
          ),
          sizeBox(10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      addOrPost ? name ?? '' : user?.userName ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: verifiedIconColor ?? Theme.of(context).primaryColor
                      ),
                    ),
                    sizeBox(10),
                    Visibility(
                      visible: user?.verified ?? false,
                      child: svgImageWithColor(
                          14,
                          14,
                          Assets.assetsProfileVerified,
                          verifiedIconColor ?? AppColors.secondary),
                    ),
                  ],
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
          ),
          sizeBox(10),
          svgImageWithColor(15, 15, Assets.iconsIconOptionVertical, verifiedIconColor ?? Theme.of(context).primaryColor)
        ],
      ),
    ),
  );
}
