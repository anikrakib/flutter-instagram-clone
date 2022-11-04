import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/theme.dart';

class ReelPostScreen extends StatelessWidget {
  const ReelPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: const Center(
        child: Text('Reel Screen'),
      ),
    );
  }
}
