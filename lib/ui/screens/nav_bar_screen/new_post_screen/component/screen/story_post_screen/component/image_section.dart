import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/new_post_screen/component/screen/story_post_screen/component/required_method.dart';
import '../../../../../../../../app/controller/user_post_controller.dart';
import '../../../../../../../../generated/assets.dart';
import '../../../../../../../../utils/constants.dart';
import '../../../../../../../app_widgets/app_image.dart';
import '../../../../../../../app_widgets/widgets.dart';
import '../../../../../../../theme.dart';

// ignore: must_be_immutable
class ImageSection extends StatelessWidget {
  ImageSection({Key? key}) : super(key: key);

  final userPostController = Get.find<UserPostController>();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add to story',
          style: TextStyle(color: AppColors.light),
        ),
        centerTitle: true,
        backgroundColor: AppColors.dark,
        leading: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: svgImageWithColor(
              22,
              22,
              Assets.iconsIconCross,
              AppColors.light,
            ),
          ),
        ),
        actions: [
          svgImageWithColor(
            30,
            30,
            Assets.iconsIconSetting,
            AppColors.light,
          ),
          sizeBox(10),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.dark,
          child: Obx(() {
            List<String> allFiles = userPostController.allImageList.value;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: defaultPadding,
                      right: defaultPadding,
                      bottom: defaultPadding / 2),
                  child: SizedBox(
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Gallery',
                          style: TextStyle(
                            color: AppColors.light,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: const BoxDecoration(
                              color: AppColors.lightBlackGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: const Center(
                            child: Text(
                              'Select',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.light,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: staggeredGridView(allFiles,userPostController),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
