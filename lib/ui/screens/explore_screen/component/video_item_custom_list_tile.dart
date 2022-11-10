import 'dart:math';
import 'package:flutter/material.dart';
import 'package:instagram_clone/app/model/explore_data_model.dart';
import 'package:instagram_clone/app/model/user_model.dart';
import 'package:instagram_clone/ui/app_widgets/widgets.dart';
import 'package:video_player/video_player.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/utils_function.dart';
import '../../../theme.dart';
import '../../nav_bar_screen/home_screen/component/feed_component/like_comment_bookmark_parts.dart';
import '../../nav_bar_screen/home_screen/component/feed_component/post_body_text.dart';
import '../../nav_bar_screen/home_screen/component/feed_component/post_header.dart';

// ignore: must_be_immutable
class VideoItemWidget extends StatefulWidget {
  VideoItemWidget({Key? key, this.videoItem, this.reelItem}) : super(key: key);
  VideoItem? videoItem;
  ReelItem? reelItem;

  @override
  State<VideoItemWidget> createState() => _VideoItemWidgetState();
}

class _VideoItemWidgetState extends State<VideoItemWidget> {
  TextEditingController controller = TextEditingController();
  late VideoPlayerController _controller;
  late String videoUrl;
  late User user;
  late String post;

  @override
  void initState() {
    super.initState();
    if (widget.videoItem?.videoUrl != null) {
      videoUrl = widget.videoItem?.videoUrl ?? '';
      post = widget.videoItem?.videoPostBody ?? '';
      user = widget.videoItem?.videoUser ??
          const User(
              userName: '',
              profileImageUrl: '',
              fullName: '',
              bio: '',
              stories: [],
              verified: false);
    } else if (widget.reelItem?.reelUrl != null) {
      videoUrl = widget.reelItem?.reelUrl ?? '';
      post = widget.reelItem?.reelPostBody ?? '';
      user = widget.reelItem?.reelUser ??
          const User(
              userName: '',
              profileImageUrl: '',
              fullName: '',
              bio: '',
              stories: [],
              verified: false);
    }
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
    _loadStory(url: videoUrl);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (_controller.value.size.height > videoSize)
          ? videoSize
          : _controller.value.size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          sizeBox(10),
          Expanded(
            child: Stack(
              children: [
                (_controller.value.isInitialized)
                    ? SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : Container(),
                postHeader(
                  user: user,
                  addOrPost: false,
                  context: context,
                  verifiedIconColor: AppColors.light,
                ),
                Positioned(
                  bottom: defaultPadding,
                  right: defaultPadding,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.grey,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        //CupertinoIcons.volume_up,
                        Icons.volume_up_rounded,
                        size: 18,
                        color: AppColors.light,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          likeCommentBookmarkParts(
            context: context,
            allComments: widget.videoItem?.comments ?? [],
            bodyText: widget.videoItem?.videoPostBody,
            name: widget.videoItem?.videoUser.userName ?? '',
            profileImage: widget.videoItem?.videoUser.profileImageUrl ?? '',
            controller: controller,
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
            visible: post.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: defaultPadding / 5,
              ),
              child: SizedBox(
                width: double.infinity,
                child: postBodyText(
                  widget.videoItem?.videoUser.userName,
                  post: post,
                ),
              ),
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
                timeAgo(DateTime.now(), true),
                style: const TextStyle(color: AppColors.faded, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loadStory({required String url}) {
    _controller.dispose();
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {});
        if (_controller.value.isInitialized) {
          _controller.play();
        }
      });
    _controller.setLooping(true);
  }
}
