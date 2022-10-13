import 'package:flutter/material.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/add_comment_text_field.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/emoji_text.dart';
import 'package:instagram_clone/ui/theme.dart';
import '../../../../../../utils/constants.dart';
import '../../../../../app_widgets/app_image.dart';
import '../../../../../app_widgets/sizeBox.dart';

class AddCommentPart extends StatelessWidget {
  const AddCommentPart({Key? key, required this.controller, required this.userImage}) : super(key: key);
  final TextEditingController controller;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: defaultPadding / 3, left: defaultPadding, right: defaultPadding),
      child: Row(
        children: [
          postHeaderImage(height: 25, width: 25, imageUrl: userImage),
          Expanded(
            child: addCommentTextField(
              textEditingController: controller,
              enabled: false,
            ),
          ),
          sizeBox(10),
          emojiText(
            size: 15,
            emoji: '❤',
            textEditingController: controller,
          ),
          sizeBox(10),
          emojiText(
            size: 15,
            emoji: '🙌',
            textEditingController: controller,
          ),
          sizeBox(10),
          svgImageWithColor(
            15,
            15,
            Assets.iconsIconAddCircle,
            AppColors.faded,
          ),
        ],
      ),
    );
  }
}
