import 'package:flutter/material.dart';
import '../../../../../app/model/user_model.dart';
import 'individual_story_screen.dart';

// ignore: must_be_immutable
class StoryScreen extends StatelessWidget {
  StoryScreen({Key? key, required this.users})
      : super(key: key);
  List<User> users;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView.builder(
      controller: controller,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return IndividualStoryScreen(users: users[index]);
      },
    );
  }
}
