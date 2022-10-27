import 'package:instagram_clone/app/model/comment_model.dart';
import 'package:instagram_clone/app/model/user_model.dart';

abstract class ListItem {}

class AddItem implements ListItem {
  final String? addName;
  final String addImage;
  String? addPost;
  final List<Comment> comments;

  AddItem({
    this.addPost,
    this.addName,
    required this.addImage,
    required this.comments,
  });
}

class PostItem implements ListItem {
  final String? postUserName;
  final String postUserImage;
  final String postImage;
  String? postBody;
  final List<Comment> comments;
  final DateTime time;
  final User user;

  PostItem({
    this.postBody,
    this.postUserName,
    required this.postUserImage,
    required this.postImage,
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
