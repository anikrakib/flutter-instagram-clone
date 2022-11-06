import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../app/controller/user_post_controller.dart';
import '../../../../../../../utils/constants.dart';
import '../../../../../../theme.dart';

class StoryPostScreen extends StatelessWidget {
  StoryPostScreen({Key? key, this.pageViewIndex = 0}) : super(key: key);
  final int pageViewIndex;

  final userPostController = Get.find<UserPostController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: userPostController.pageController,
        itemCount: listStoryPostScreenPage.length,
        onPageChanged: (index){
          userPostController.updatePageViewIndex(index);
          if(index == 0) {
            userPostController.updateShowAddToStoryPage(true);
          } else if(index == 1) {
            userPostController.updateShowAddToStoryPage(false);
          }
        },
        itemBuilder: (context, index){
          return listStoryPostScreenPage[index];
        },
      ),
    );
  }
}

