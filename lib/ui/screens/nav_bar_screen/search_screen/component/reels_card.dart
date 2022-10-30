import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../generated/assets.dart';
import '../../../../app_widgets/app_image.dart';
import '../../../../theme.dart';

class ReelsCard extends StatefulWidget {
  const ReelsCard({Key? key, required this.reelsUrl}) : super(key: key);
  final String reelsUrl;

  @override
  State<ReelsCard> createState() => _ReelsCardState();
}

class _ReelsCardState extends State<ReelsCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.reelsUrl)
      ..initialize().then((_) {
        setState(() {});
      });
    _loadStory(url: widget.reelsUrl);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*_controller.value.isInitialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : Container(),*/
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
          bottom: 8,
          left: 8,
          child: navigationSVGImage(
            context,
            Assets.iconsIconReelsFill,
            22,
            AppColors.light,
          ),
        ),
      ],
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
