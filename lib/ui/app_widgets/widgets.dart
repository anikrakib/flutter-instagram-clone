import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import '../../utils/utils_function.dart';
import '../theme.dart';

SizedBox sizeBox(double size) => SizedBox(
      width: size,
      height: size,
    );

Container shadowFullScreen() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black.withOpacity(0.3),
          Colors.transparent,
        ],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        tileMode: TileMode.repeated,
      ),
    ),
  );
}

Row buildFeaturesRow(
    {required String path, String text = '', double padding = 5.0}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 35,
        width: 35,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: svgImage(path),
        ),
      ),
      sizeBox(10),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.light,
          ),
        ),
      ),
    ],
  );
}

Widget iconAndTextListTile(BuildContext context, String text,
    {String? path, IconData? icons, String? routesPath}) {
  return GestureDetector(
    onTap: () {
      routesPath != null
          ? goTOAnotherPage(routesPath)
          : Get.snackbar(text, 'Coming Soon...');
    },
    child: Row(
      children: [
        path != null
            ? svgImageWithColor(22, 22, path, Theme.of(context).primaryColor)
            : Icon(
                icons,
                size: 25,
              ),
        sizeBox(10),
        Text(
          text,
          style: AppTextStyle.bottomSheetTextStyle,
        )
      ],
    ),
  );
}
