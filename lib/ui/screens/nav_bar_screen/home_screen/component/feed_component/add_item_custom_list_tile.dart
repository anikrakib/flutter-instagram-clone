import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/add_comment_part.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/like_comment_bookmark_parts.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_body_text.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/first_comment.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/post_header.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../../../../../app/model/view_type.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../../utils/utils_function.dart';
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
  PageController pageController = PageController(initialPage: 0);
  int activePage = 0;

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
      NetworkImage(widget.item.images.first),
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
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          postHeader(
              name: widget.item.addName, addOrPost: true, context: context),
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: widget.item.images.length,
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
                        imageUrl: widget.item.images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
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
          likeCommentBookmarkParts(
            context: context,
            allComments: widget.item.comments,
            bodyText: widget.item.addPost,
            name: widget.item.addName,
            profileImage: widget.item.addImage,
            controller: controller,
            images: widget.item.images,
            activePage: activePage,
          ),
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
            visible: widget.item.addPost?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: defaultPadding / 5,
                  left: defaultPadding,
                  right: defaultPadding),
              child: SizedBox(
                width: double.infinity,
                child: postBodyText(
                  widget.item.addName,
                  post: widget.item.addPost.toString(),
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
              onTap: () => {
                goTOCommentsPageWithArguments(
                  path: Routes.comments,
                  comments: widget.item.comments,
                  bodyText: widget.item.addPost,
                  name: widget.item.addName,
                  image: widget.item.images.first,
                  controller: controller,
                )
              },
              child: Visibility(
                visible: widget.item.comments.isNotEmpty,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'View all ${widget.item.comments.length} comments',
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
              onTap: () => {
                goTOCommentsPageWithArguments(
                  path: Routes.comments,
                  comments: widget.item.comments,
                  controller: controller,
                )
              },
              child: Visibility(
                visible: widget.item.comments.isNotEmpty,
                child: comment(widget.item),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              goTOCommentsPageWithArguments(
                path: Routes.comments,
                comments: widget.item.comments,
                controller: controller,
              )
            },
            child: AddCommentPart(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}

Widget comment(AddItem item) {
  if (item.comments.isNotEmpty) {
    return showFirstComment(item.comments[0]);
  } else {
    return Container();
  }
}
