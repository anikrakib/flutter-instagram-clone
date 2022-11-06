import 'package:flutter/material.dart';
import '../../../../../../../../app/controller/user_post_controller.dart';
import '../../../../../../../../app/model/file_model.dart';
import '../../../../../../../../generated/assets.dart';
import '../../../../../../../../utils/constants.dart';
import '../../../../../../../app_widgets/app_image.dart';
import '../../../../../../../app_widgets/widgets.dart';
import '../../../../../../../theme.dart';

// ignore: must_be_immutable
class CustomMiddleWidget extends StatelessWidget {
  CustomMiddleWidget(
      this.selectedModel, this.userPostController, this.files, this.context,
      {Key? key})
      : super(key: key);
  FileModel selectedModel;
  UserPostController userPostController;
  List<FileModel> files;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Padding(
        padding: const EdgeInsets.only(
            left: defaultPadding / 2, right: defaultPadding / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                items: getItems(),
                onChanged: (item) {
                  assert(item!.files.isNotEmpty);
                  //image = item!.files[0];
                  userPostController.updateImage(item!.files[0]);
                  userPostController.updateSelectModel(item);
                },
                value: selectedModel,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 35,
                  decoration: const BoxDecoration(
                      color: AppColors.lightBlackGrey,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      sizeBox(10),
                      svgImageWithColor(18, 18, Assets.iconsIconSelectMultiple,
                          AppColors.light),
                      sizeBox(10),
                      const Text(
                        'SELECT MULTIPLE',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.light,
                        ),
                      ),
                      sizeBox(10),
                    ],
                  ),
                ),
                sizeBox(10),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightBlackGrey,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      child: svgImageWithColor(
                          18, 18, Assets.iconsIconCamera, AppColors.light)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem> getItems() {
    return files
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e.folder,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
        .toList();
  }
}
