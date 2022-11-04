import 'package:flutter/material.dart';
import '../../../../../../theme.dart';

class LivePostScreen extends StatelessWidget {
  const LivePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: Column(
        children: [
          const Center(
            child: Text('Live Screen'),
          ),
          AnimatedContainer (
            duration: Duration (seconds: 1),
            width: 40,
            height: 40,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
