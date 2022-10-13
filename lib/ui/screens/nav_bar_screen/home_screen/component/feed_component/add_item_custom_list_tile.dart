import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/add_comment_part.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/like_comment_bookmark_parts.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_body_text.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_header.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../../../../../app/model/view_type.dart';
import '../../../../../theme.dart';

PaletteColor? bgColor;
Random random = Random();

// ignore: must_be_immutable
class AddItemWidget extends StatefulWidget {
  AddItemWidget({Key? key, required this.item}) : super(key: key);
  final AddItem item;
  final userInfo = GetStorage();
  String userImage = '';

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.userInfo.read(userProfilePicKey) != null) {
      widget.userImage = widget.userInfo.read(userProfilePicKey);
    }
    _updatePalette();
  }

  _updatePalette() async {
    PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.item.addImage),
      size: const Size(200, 100),
    );
    setState(() {
      palette.darkMutedColor != null
          ? bgColor = palette.darkMutedColor
          : bgColor = PaletteColor(Colors.red, 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return addItemCustomListTile(
        widget.item, context, controller, widget.userImage);
  }
}

SizedBox addItemCustomListTile(AddItem item, BuildContext context,
    TextEditingController controller, userImage) {
  return SizedBox(
    width: double.infinity,
    height: 500,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        postHeader(item.addName, true, context),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: item.addImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -1,
                right: -1,
                left: -1,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: defaultPadding, right: defaultPadding),
                  width: double.infinity,
                  height: 45,
                  color: bgColor?.color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Learn More',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        CupertinoIcons.forward,
                        size: 18,
                        color: AppColors.light,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        likeCommentBookmarkParts(context),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: defaultPadding / 2,
            left: defaultPadding,
          ),
          child: Text(
            '${random.nextInt(1000 + 100)} likes',
            style: AppTextStyle.textStyleSmall,
          ),
        ),
        Visibility(
          visible: item.addPost?.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(
                top: defaultPadding / 5,
                left: defaultPadding,
                right: defaultPadding),
            child: postBodyText(
              item.addName,
              post: item.addPost.toString(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: defaultPadding / 5,
            left: defaultPadding,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'View all ${item.comments.length} comments',
              style: AppTextStyle.textStyleFadedSmall,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: defaultPadding / 5, left: defaultPadding, right: defaultPadding),
          child: postBodyText(item.comments[0].commentOwner.username, post: item.comments[0].comment),
        ),
        AddCommentPart(
          controller: controller,
          userImage: userImage,
        ),
      ],
    ),
  );
}
