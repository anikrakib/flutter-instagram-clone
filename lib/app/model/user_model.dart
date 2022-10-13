import 'package:instagram_clone/app/model/story_model.dart';
import 'package:instagram_clone/app/model/view_type.dart';

class User {
  final String userName;
  final String profileImageUrl;
  final String fullName;
  final String bio;
  final List<Story> stories;
  //final List<PostItem> posts;

  const User({
    required this.userName,
    required this.profileImageUrl,
    required this.fullName,
    required this.bio,
    required this.stories,
    //required this.posts,
  });
}