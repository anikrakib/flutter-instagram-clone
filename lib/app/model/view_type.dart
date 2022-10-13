import 'package:instagram_clone/app/model/comment_model.dart';

abstract class ListItem {}

class AddItem implements ListItem {
  final String addName;
  final String addImage;
  String? addPost;
  final List<Comment> comments;

  AddItem({
    this.addPost,
    required this.addName,
    required this.addImage,
    required this.comments,
  });
}

class PostItem implements ListItem {
  final String postUserName;
  final String postImage;
  String? postBody;
  final List<Comment> comments;
  final DateTime time;

  PostItem({
    this.postBody,
    required this.postUserName,
    required this.postImage,
    required this.comments,
    required this.time,
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
