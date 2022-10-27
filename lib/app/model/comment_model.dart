import 'package:instagram_clone/app/model/user_model.dart';

class Comment {
  final String createdTime;
  final User commentOwner;
  final String comment;

  Comment({
    required this.createdTime,
    required this.commentOwner,
    required this.comment,
  });
}
