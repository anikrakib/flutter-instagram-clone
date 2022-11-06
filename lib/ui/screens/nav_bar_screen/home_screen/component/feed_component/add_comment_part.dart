import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/add_comment_text_field.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/emoji_text.dart';
import 'package:instagram_clone/ui/theme.dart';
import '../../../../../../utils/constants.dart';
import '../../../../../app_widgets/app_image.dart';
import '../../../../../app_widgets/widgets.dart';

class AddCommentPart extends StatefulWidget {
  const AddCommentPart({Key? key, required this.controller,}) : super(key: key);
  final TextEditingController controller;

  @override
  State<AddCommentPart> createState() => _AddCommentPartState();
}

class _AddCommentPartState extends State<AddCommentPart> {
  final userInfo = GetStorage();
  String userImage = '';

  @override
  void initState() {
    if (userInfo.read('userProfilePic') != null) {
      userImage = userInfo.read('userProfilePic');
    }
    super.initState();
  }

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
              textEditingController: widget.controller,
              enabled: false,
            ),
          ),
          sizeBox(10),
          emojiText(
            size: 15,
            emoji: '❤',
            textEditingController: widget.controller,
          ),
          sizeBox(10),
          emojiText(
            size: 15,
            emoji: '🙌',
            textEditingController: widget.controller,
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
