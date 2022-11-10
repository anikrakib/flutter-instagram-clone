import 'package:instagram_clone/app/model/comment_model.dart';
import 'package:instagram_clone/app/model/user_model.dart';

abstract class ListItem {}

class AddItem implements ListItem {
  final String addImage;
  final String addName;
  final List<String> images;
  String? addPost;
  final List<Comment> comments;

  AddItem({
    this.addPost,
    required this.addName,
    required this.images,
    required this.comments,
    required this.addImage,
  });
}

class PostItem implements ListItem {
  final String postUserImage;
  final List<String> images;
  String? postBody;
  final List<Comment> comments;
  final DateTime time;
  final User user;

  PostItem({
    this.postBody,
    required this.postUserImage,
    required this.images,
    required this.comments,
    required this.time,
    required this.user,
  });
}

class SuggestUsers implements ListItem {
  final List<SuggestUser> suggestUsers;

  SuggestUsers({required this.suggestUsers});
}

class SuggestUser {
  final String userName;
  final String userImage;

  SuggestUser({
    required this.userName,
    required this.userImage,
  });
}
