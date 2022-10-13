import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/add_comment_text_field.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/emoji_text.dart';
import '../../../../../theme.dart';

class CommentBox extends StatelessWidget {
  const CommentBox(
      {Key? key, required this.textEditingController, required this.userImage})
      : super(key: key);
  final TextEditingController textEditingController;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (Theme.of(context).brightness == Brightness.light)
            ? AppColors.light
            : AppColors.dark,
        border: Border(
            top: BorderSide(
          color: (Theme.of(context).brightness == Brightness.light)
              ? AppColors.lightGrey
              : AppColors.grey,
        )),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  emojiText(emoji: '❤',textEditingController: textEditingController),
                  emojiText(emoji: '🙌',textEditingController: textEditingController),
                  emojiText(emoji: '🔥',textEditingController: textEditingController),
                  emojiText(emoji: '👏🏻',textEditingController: textEditingController),
                  emojiText(emoji: '😢',textEditingController: textEditingController),
                  emojiText(emoji: '😍',textEditingController: textEditingController),
                  emojiText(emoji: '😮',textEditingController: textEditingController),
                  emojiText(emoji: '😂',textEditingController: textEditingController),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: postHeaderImage(imageUrl: userImage),
                ),
                Expanded(
                  child: addCommentTextField(textEditingController: textEditingController,enabled: true),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

