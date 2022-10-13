import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/add_comment_part.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/like_comment_bookmark_parts.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_body_text.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_header.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../../../../app/model/view_type.dart';

// ignore: must_be_immutable
class PostItemWidget extends StatefulWidget {
  PostItemWidget({Key? key, required this.postItem}) : super(key: key);
  final PostItem postItem;
  final userInfo = GetStorage();
  String userImage = '';

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.userInfo.read(userProfilePicKey) != null) {
      widget.userImage = widget.userInfo.read(userProfilePicKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return postItemCustomListTile(
        widget.postItem, context, controller, widget.userImage);
  }
}

SizedBox postItemCustomListTile(PostItem item, BuildContext context,
    TextEditingController controller, String userImage) {
  return SizedBox(
    width: double.infinity,
    height: 550,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        postHeader(item.postUserName, false, context),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: item.postImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        likeCommentBookmarkParts(context),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 8.0,
            left: defaultPadding,
          ),
          child: Text(
            '${Random().nextInt(1000 + 100)} likes',
            style: AppTextStyle.textStyleSmall,
          ),
        ),
        Visibility(
          visible: item.postBody?.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: defaultPadding / 5),
            child: postBodyText(
              item.postUserName,
              post: item.postBody.toString(),
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
              top: defaultPadding / 5,
              left: defaultPadding,
              right: defaultPadding),
          child: postBodyText(item.comments[0].commentOwner.username,
              post: item.comments[0].comment),
        ),
        AddCommentPart(
          controller: controller,
          userImage: userImage,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: defaultPadding,
            right: defaultPadding
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              timeAgo(item.time, true),
              style: const TextStyle(color: AppColors.faded, fontSize: 10),
            ),
          ),
        ),

        /*Padding(
          padding: const EdgeInsets.only(top: defaultPadding / 3),
          child: CommentBox(
            textEditingController: controller,
            userImage: userImage,
          ),
        ),*/
      ],
    ),
  );
}

String timeAgo(DateTime postTime, bool numericDates) {
  final date2 = DateTime.now();
  final difference = date2.difference(postTime);

  if ((difference.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes >= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} seconds ago';
  } else {
    return 'Just now';
  }
}
