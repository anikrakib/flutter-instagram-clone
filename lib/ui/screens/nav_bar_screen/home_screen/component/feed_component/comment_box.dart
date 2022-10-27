import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/add_comment_text_field.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/emoji_text.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../../../theme.dart';

class CommentBox extends StatefulWidget {
  const CommentBox(
      {Key? key, required this.textEditingController,})
      : super(key: key);
  final TextEditingController textEditingController;

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
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
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding/2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                emojiText(emoji: '❤',textEditingController: widget.textEditingController),
                emojiText(emoji: '🙌',textEditingController: widget.textEditingController),
                emojiText(emoji: '🔥',textEditingController: widget.textEditingController),
                emojiText(emoji: '👏🏻',textEditingController: widget.textEditingController),
                emojiText(emoji: '😢',textEditingController: widget.textEditingController),
                emojiText(emoji: '😍',textEditingController: widget.textEditingController),
                emojiText(emoji: '😮',textEditingController: widget.textEditingController),
                emojiText(emoji: '😂',textEditingController: widget.textEditingController),
              ],
            ),
          ),
          Divider(
            thickness: 0.1,
            color: Theme.of(context).primaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding,left: defaultPadding,bottom: defaultPadding,),
                child: postHeaderImage(imageUrl: userImage),
              ),
              Expanded(
                child: addCommentTextField(textEditingController: widget.textEditingController,enabled: true),
              ),
              const SizedBox(
                width: defaultPadding/2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

