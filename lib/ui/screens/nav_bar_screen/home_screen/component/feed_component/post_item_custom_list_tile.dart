import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/add_comment_part.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/like_comment_bookmark_parts.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_body_text.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/first_comment.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_header.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:instagram_clone/utils/utils_function.dart';
import '../../../../../../app/model/view_type.dart';
import '../../../../../../routes/app_routes.dart';

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
  PageController pageController = PageController(initialPage: 0);
  int activePage = 0;

  @override
  void initState() {
    super.initState();

    if (widget.userInfo.read(userProfilePicKey) != null) {
      widget.userImage = widget.userInfo.read(userProfilePicKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          postHeader(
            user: widget.postItem.user,
            addOrPost: false,
            context: context,
          ),
          Expanded(
            child: PageView.builder(
              itemCount: widget.postItem.images.length,
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
                    imageUrl: widget.postItem.images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          likeCommentBookmarkParts(
            context: context,
            allComments: widget.postItem.comments,
            bodyText: widget.postItem.postBody,
            name: widget.postItem.user.userName,
            profileImage: widget.postItem.user.profileImageUrl,
            controller: controller,
            images: widget.postItem.images,
            activePage: activePage,
          ),
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
            visible: widget.postItem.postBody?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: defaultPadding / 5,
              ),
              child: SizedBox(
                width: double.infinity,
                child: postBodyText(
                  widget.postItem.user.userName,
                  post: widget.postItem.postBody.toString(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: defaultPadding / 5,
              left: defaultPadding,
            ),
            child: GestureDetector(
              /*onTap: () => goTOCommentsPageWithArguments(
                path: Routes.comments,
                postItem: widget.postItem,
                listItem: widget.postItem,
                controller: controller,
              ),*/
              onTap: () => {
                goTOCommentsPageWithArguments(
                  path: Routes.comments,
                  comments: widget.postItem.comments,
                  bodyText: widget.postItem.postBody,
                  name: widget.postItem.user.userName,
                  image: widget.postItem.user.profileImageUrl,
                  controller: controller,
                )
              },
              child: Visibility(
                visible: widget.postItem.comments.isNotEmpty,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'View all ${widget.postItem.comments.length} comments',
                    style: AppTextStyle.textStyleFadedSmall,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: defaultPadding / 5,
              left: defaultPadding,
              right: defaultPadding,
            ),
            child: GestureDetector(
              /*onTap: () => goTOCommentsPageWithArguments(
                path: Routes.comments,
                postItem: widget.postItem,
                listItem: widget.postItem,
                controller: controller,
              ),*/
              onTap: () => {
                goTOCommentsPageWithArguments(
                  path: Routes.comments,
                  comments: widget.postItem.comments,
                  bodyText: widget.postItem.postBody,
                  name: widget.postItem.user.userName,
                  image: widget.postItem.user.profileImageUrl,
                  controller: controller,
                )
              },
              child: Visibility(
                visible: widget.postItem.comments.isNotEmpty,
                child: comment(widget.postItem),
              ),
            ),
          ),
          GestureDetector(
            /*onTap: () => goTOCommentsPageWithArguments(
                path: Routes.comments,
                postItem:  widget.postItem,
                listItem:  widget.postItem,
                controller: controller),*/
            onTap: () => {
              goTOCommentsPageWithArguments(
                path: Routes.comments,
                comments: widget.postItem.comments,
                bodyText: widget.postItem.postBody,
                name: widget.postItem.user.userName,
                image: widget.postItem.user.profileImageUrl,
                controller: controller,
              )
            },
            child: AddCommentPart(
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: defaultPadding / 4),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                timeAgo(widget.postItem.time, true),
                style: const TextStyle(color: AppColors.faded, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

function(PostItem postItem, TextEditingController controller) {
  goTOCommentsPageWithArguments(
    path: Routes.comments,
    comments: postItem.comments,
    bodyText: postItem.postBody,
    name: postItem.user.userName,
    image: postItem.user.profileImageUrl,
    controller: controller,
  );
}

Widget comment(PostItem item) {
  if (item.comments.isNotEmpty) {
    return showFirstComment(item.comments[0]);
  } else {
    return Container();
  }
}
