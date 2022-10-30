import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/model/explore_data_model.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:video_player/video_player.dart';
import '../../../../../generated/assets.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../app_widgets/app_image.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({Key? key, required this.videoItem, required this.currentPosition}) : super(key: key);
  final VideoItem videoItem;
  final int currentPosition;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoItem.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
    _loadStory(url: widget.videoItem.videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(
              Routes.explore,
              arguments: [
                widget.videoItem,
                widget.currentPosition,
              ]
          );
      },
      child: Stack(
        children: [
          _controller.value.isInitialized
              ? SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                )
              : Container(),
          Positioned(
            top: 8,
            right: 8,
            child: navigationSVGImage(
              context,
              Assets.iconsIconReelsFill,
              17,
              AppColors.light,
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
          _controller.pause();
        }
      });
    _controller.setLooping(true);
  }
}
