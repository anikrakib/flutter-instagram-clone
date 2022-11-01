import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../app/model/story_model.dart';
import '../../../../../app/model/user_model.dart';
import '../component/animated_myday_progress_bar.dart';
import '../component/user_info_in_my_day_part.dart';

class IndividualStoryScreen extends StatefulWidget {
  final User users;

  const IndividualStoryScreen({
    required this.users,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _IndividualStoryScreenState createState() => _IndividualStoryScreenState();
}

class _IndividualStoryScreenState extends State<IndividualStoryScreen>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  late AnimationController animController;
  late VideoPlayerController videoController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    animController = AnimationController(vsync: this);
    videoController = VideoPlayerController.network('')
      ..initialize().then((_) {
        setState(() {});
      });

    final Story firstStory = widget.users.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animController.stop();
        animController.reset();
        setState(() {
          if (currentIndex + 1 < widget.users.stories.length) {
            currentIndex += 1;
            _loadStory(story: widget.users.stories[currentIndex]);
          } else {
            currentIndex = 0;
            _loadStory(story: widget.users.stories[currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    animController.dispose();
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.users.stories[currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.users.stories.length,
              itemBuilder: (context, i) {
                final Story story = widget.users.stories[i];
                switch (story.media) {
                  case MediaType.image:
                    return CachedNetworkImage(
                      imageUrl: story.url,
                      fit: BoxFit.cover,
                    );
                  case MediaType.video:
                    if (videoController.value.isInitialized) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: videoController.value.size.width,
                          height: videoController.value.size.height,
                          child: VideoPlayer(videoController),
                        ),
                      );
                    }
                }
                return const SizedBox.shrink();
              },
            ),
            Positioned(
              top: 40.0,
              left: 10.0,
              right: 10.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: widget.users.stories
                        .asMap()
                        .map((i, e) {
                          return MapEntry(
                            i,
                            AnimatedProgressBar(
                              animController: animController,
                              position: i,
                              currentIndex: currentIndex,
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1.5,
                      vertical: 2,
                    ),
                    child: UserInfo(user: widget.users),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (currentIndex - 1 >= 0) {
          currentIndex -= 1;
          _loadStory(story: widget.users.stories[currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (currentIndex + 1 < widget.users.stories.length) {
          currentIndex += 1;
          _loadStory(story: widget.users.stories[currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          currentIndex = 0;
          _loadStory(story: widget.users.stories[currentIndex]);
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (videoController.value.isPlaying) {
          videoController.pause();
          animController.stop();
        } else {
          videoController.play();
          animController.forward();
        }
      }
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    animController.stop();
    animController.reset();
    switch (story.media) {
      case MediaType.image:
        animController.duration = story.duration;
        animController.forward();
        break;
      case MediaType.video:
        //_videoController = null;
        videoController.dispose();
        videoController = VideoPlayerController.network(story.url)
          ..initialize().then((_) {
            setState(() {});
            if (videoController.value.isInitialized) {
              animController.duration = videoController.value.duration;
              videoController.play();
              animController.forward();
            }
          });
        break;
    }
    if (animateToPage) {
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
