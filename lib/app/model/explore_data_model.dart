import 'package:instagram_clone/app/model/comment_model.dart';
import 'package:instagram_clone/app/model/user_model.dart';

abstract class SearchListItem {}

class ImageItem implements SearchListItem {
  String? postBody;
  final User user;
  final List<Comment> comments;
  final List<String> images;

  ImageItem({
    this.postBody,
    required this.user,
    required this.images,
    required this.comments,
  });
}

class ReelItem implements SearchListItem {
  String? reelPostBody;
  final User reelUser;
  final String reelUrl;
  final String reelMusicName;
  final List<Comment> comments;
  final int like;
  final String location;

  ReelItem({
    this.reelPostBody,
    required this.reelUser,
    required this.reelUrl,
    required this.reelMusicName,
    required this.comments,
    required this.like,
    required this.location,
  });
}

class VideoItem implements SearchListItem {
  String? videoPostBody;
  final User videoUser;
  final String videoUrl;
  final List<Comment> comments;

  VideoItem({
    this.videoPostBody,
    required this.videoUser,
    required this.videoUrl,
    required this.comments,
  });
}
