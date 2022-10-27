import 'package:flutter/material.dart';
import 'package:instagram_clone/app/model/comment_model.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_body_text.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../app_widgets/app_image.dart';
import '../../../../../theme.dart';

Row showFirstComment(Comment? comment) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
        child: postBodyText(
          comment?.commentOwner.userName,
          post: comment?.comment ?? '',
        ),
      ),
      svgImageWithColor(12, 12, Assets.bottomNavbarIconHeart, AppColors.faded),
    ],
  );
}
