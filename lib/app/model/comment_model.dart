import 'package:instagram_clone/app/model/comment_owner.dart';

class Comment {
  final String createdTime;
  final CommentOwner commentOwner;
  final String comment;

  Comment({
    required this.createdTime,
    required this.commentOwner,
    required this.comment,
  });
}
