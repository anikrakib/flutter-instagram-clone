import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../app/model/story_model.dart';
import '../../../../../app/model/user_model.dart';
import '../component/animated_app_bar.dart';
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
  late PageController _pageController;
  late AnimationController _animController;
  late VideoPlayerController _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);
    _videoController = VideoPlayerController.network('')
      ..initialize().then((_) {
        setState(() {});
      });

    final Story firstStory = widget.users.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.users.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.users.stories[_currentIndex]);
          } else {
            _currentIndex = 0;
            _loadStory(story: widget.users.stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.users.stories[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
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
                    if (_videoController.value.isInitialized) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController.value.size.width,
                          height: _videoController.value.size.height,
                          child: VideoPlayer(_videoController),
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
                            AnimatedBar(
                              animController: _animController,
                              position: i,
                              currentIndex: _currentIndex,
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
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.users.stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.users.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.users.stories[_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          _currentIndex = 0;
          _loadStory(story: widget.users.stories[_currentIndex]);
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (_videoController.value.isPlaying) {
          _videoController.pause();
          _animController.stop();
        } else {
          _videoController.play();
          _animController.forward();
        }
      }
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    switch (story.media) {
      case MediaType.image:
        _animController.duration = story.duration;
        _animController.forward();
        break;
      case MediaType.video:
        //_videoController = null;
        _videoController.dispose();
        _videoController = VideoPlayerController.network(story.url)
          ..initialize().then((_) {
            setState(() {});
            if (_videoController.value.isInitialized) {
              _animController.duration = _videoController.value.duration;
              _videoController.play();
              _animController.forward();
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
