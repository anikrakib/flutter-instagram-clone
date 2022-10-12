
enum MediaType {
  image,
  video,
}

class VideoStory{
  final String url;
  final Duration duration;

  const VideoStory({
    required this.url,
    required this.duration,
  });

}

class Story {
  final String url;
  final MediaType media;
  final Duration duration;

  const Story({
    required this.url,
    required this.media,
    required this.duration,
  });
}
