import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../theme.dart';

SvgPicture appLogo(context) => SvgPicture.asset(Assets.assetsAppLogo,
    width: 180,
    height: 50,
    color: Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white
    //color: Get.isDarkMode ? AppColors.light : AppColors.dark,
    );

SvgPicture svgImage(double height, double width, String path) =>
    SvgPicture.asset(
      path,
      width: width,
      height: height,
      color: Get.isDarkMode ? AppColors.light : AppColors.dark,
    );

SvgPicture svgImageWithColor(
        double height, double width, String path, Color color) =>
    SvgPicture.asset(
      path,
      width: width,
      height: height,
      color: color,
    );

SvgPicture navigationSVGImageWithoutColor(String imagePath) {
  return SvgPicture.asset(
    imagePath,
    height: 21,
    width: 21,
  );
}

SvgPicture navigationSVGImage(
  BuildContext context,
  String imagePath,
) {
  return SvgPicture.asset(
    imagePath,
    height: 21,
    width: 21,
    color: Theme.of(context).primaryColor,
  );
}
