import 'package:flutter/material.dart';
import '../../../../../../theme.dart';

class StoryPostScreen extends StatelessWidget {
  const StoryPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: const Center(
        child: Text('Story Screen'),
      ),
    );
  }
}
