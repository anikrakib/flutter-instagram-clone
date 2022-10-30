import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/app/model/explore_data_model.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/like_comment_bookmark_parts.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_body_text.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_header.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:instagram_clone/utils/utils_function.dart';

// ignore: must_be_immutable
class ImageItemWidget extends StatefulWidget {
  const ImageItemWidget({Key? key, required this.imageItem}) : super(key: key);
  final ImageItem imageItem;

  @override
  State<ImageItemWidget> createState() => _ImageItemWidgetState();
}

class _ImageItemWidgetState extends State<ImageItemWidget> {
  PageController pageController = PageController(initialPage: 0);
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          postHeader(
            user: widget.imageItem.user,
            addOrPost: false,
            context: context,
          ),
          Expanded(
            child: PageView.builder(
              itemCount: widget.imageItem.images.length,
              pageSnapping: true,
              controller: pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: widget.imageItem.images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          likeCommentBookmarkParts(context, widget.imageItem.images, activePage),
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
            visible: widget.imageItem.postBody?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: defaultPadding / 5,
              ),
              child: SizedBox(
                width: double.infinity,
                child: postBodyText(
                  widget.imageItem.user.userName,
                  post: widget.imageItem.postBody.toString(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding, right: defaultPadding,top: defaultPadding/4),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                timeAgo(DateTime.now(), true),
                style: const TextStyle(color: AppColors.faded, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
