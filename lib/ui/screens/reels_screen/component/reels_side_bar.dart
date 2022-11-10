import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/screens/reels_screen/screen/reels_comment_screen.dart';
import 'package:video_player/video_player.dart';
import '../../../../generated/assets.dart';
import '../../../app_widgets/custom_action_button.dart';
import '../../../app_widgets/widgets.dart';
import '../../../theme.dart';
import 'individual_reels_item.dart';

// ignore: must_be_immutable
class ReelSideBar extends StatelessWidget {
  const ReelSideBar({
    Key? key,
    this.widget,
    required this.controller,
  }) : super(key: key);

  final IndividualReelItem? widget;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconButtonWidget(
          function: () {},
          color: AppColors.light,
          iconPath: Assets.iconsIconHeart,
        ),
        Text(
          '${widget?.reelItem.like}k',
          style: AppTextStyle.reelsTextStyle,
        ),
        sizeBox(10),
        iconButtonWidget(
          function: () {
            Get.to(
              ReelsCommentScreen(
                controller: controller,
                reelItem: widget!.reelItem,
              ),
            );
          },
          color: AppColors.light,
          iconPath: Assets.iconsIconComment,
        ),
        Text(
          '${widget?.reelItem.comments.length}',
          style: AppTextStyle.reelsTextStyle,
        ),
        sizeBox(10),
        iconButtonWidget(
          function: () {},
          color: AppColors.light,
          iconPath: Assets.iconsIconMessage,
        ),
        sizeBox(10),
        iconButtonWidget(
          function: () {},
          color: AppColors.light,
          iconPath: Assets.iconsIconOptionVertical,
        ),
        sizeBox(10),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.light, width: 2),
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                widget?.reelItem.reelUser.profileImageUrl ?? '',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
