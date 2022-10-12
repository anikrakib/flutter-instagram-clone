import 'package:flutter/material.dart';
import '../../../../../app/model/user_model.dart';
import 'individual_story_screen.dart';

// ignore: must_be_immutable
class StoryScreen extends StatefulWidget {
  StoryScreen({Key? key, required this.users})
      : super(key: key);
  List<User> users;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView.builder(
      controller: controller,
      itemCount: widget.users.length,
      itemBuilder: (context, index) {
        return IndividualStoryScreen(users: widget.users[index]);
      },
    );
  }
}
