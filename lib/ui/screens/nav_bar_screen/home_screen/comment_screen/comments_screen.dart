import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/app_widgets/widgets.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/comment_box.dart';
import '../../../../../app/model/comment_model.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/utils_function.dart';
import '../../../../theme.dart';
import '../component/feed_component/post_body_text.dart';
import '../component/user_story_design.dart';
import 'component/comments_app_bar.dart';

class Comments extends StatelessWidget {
  const Comments(
      {Key? key,
      required this.allComments,
      this.body,
      this.userName,
      this.userImage,
      this.controller})
      : super(key: key);
  final List<Comment> allComments;
  final String? body;
  final String? userName;
  final String? userImage;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commentsAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      commentScreenUserPostSection(
                        context: context,
                        post: body ?? '',
                        name: userName ?? '',
                        time: DateTime.now(),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: allComments.length,
                        itemBuilder: (context, index) => commentTileDesign(
                          context: context,
                          comment: allComments[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CommentBox(
              textEditingController: controller ?? TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }

  Widget commentTileDesign({
    required BuildContext context,
    required Comment comment,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(right: defaultPadding, left: defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userMyDayProfileImage(
            context: context,
            myDayProfilePicSize: myDayProfilePicSize - 15,
            padding: myDayPadding / 1.5,
            imageUrl: comment.commentOwner.profileImageUrl,
          ),
          sizeBox(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.commentOwner.userName,
                      style: TextStyle(
                        color:
                            Get.isDarkMode ? AppColors.light : AppColors.dark,
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                      ),
                    ),
                    sizeBox(2.5),
                    Visibility(
                      visible: comment.commentOwner.verified,
                      child: svgImageWithHeightAndWidth(
                          12, 12, Assets.assetsProfileVerified),
                    ),
                    sizeBox(5),
                    Expanded(
                      child: Text(
                        comment.comment,
                        style: AppTextStyle.textStyleSmall,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
                sizeBox(5),
                Row(
                  children: [
                    Text(
                      comment.createdTime,
                      style: AppTextStyle.textStyleFadedSmall,
                    ),
                    sizeBox(20),
                    Text(
                      '${Random().nextInt(1000) + 1} Likes',
                      style: AppTextStyle.textStyleFadedSmall,
                    ),
                    sizeBox(20),
                    const Text(
                      'Reply',
                      style: AppTextStyle.textStyleFadedSmall,
                    ),
                  ],
                ),
                sizeBox(15),
                Row(
                  children: [
                    SizedBox(
                      width: defaultPadding * 2,
                      child: Divider(
                        thickness: 0.3,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    sizeBox(10),
                    Text(
                      'View ${Random().nextInt(50) + 1} replies',
                      style: AppTextStyle.textStyleFadedSmall,
                    ),
                  ],
                ),
                sizeBox(defaultPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget commentScreenUserPostSection({
    required BuildContext context,
    required String post,
    required String name,
    DateTime? time,
  }) {
    return Visibility(
      visible: post.isNotEmpty,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: defaultPadding / 2,
                right: defaultPadding,
                left: defaultPadding),
            child: Row(
              children: [
                userMyDayProfileImage(
                  context: context,
                  myDayProfilePicSize: myDayProfilePicSize - 15,
                  padding: myDayPadding / 1.5,
                  imageUrl: userImage ?? '',
                ),
                sizeBox(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      postBodyText(
                        name,
                        post: post,
                      ),
                      sizeBox(5),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          timeAgo(time!, true),
                          style: const TextStyle(
                              color: AppColors.faded, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          sizeBox(5),
          Divider(
            thickness: 0.1,
            color: Theme.of(context).primaryColor,
          ),
          sizeBox(10)
        ],
      ),
    );
  }
}
