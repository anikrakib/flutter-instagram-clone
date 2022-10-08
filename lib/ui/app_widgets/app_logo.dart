import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../theme.dart';

SvgPicture appLogo() => SvgPicture.asset(
      Assets.assetsAppLogo,
      width: 180,
      height: 50,
      color: Get.isDarkMode ? AppColors.light : AppColors.dark,
    );

SvgPicture svgImage(double height, double width, String path) => SvgPicture.asset(
  path,
  width: width,
  height: height,
  color: Get.isDarkMode ? AppColors.light : AppColors.dark,
);

SvgPicture svgImageWithColor(double height, double width, String path, Color color) => SvgPicture.asset(
  path,
  width: width,
  height: height,
  color: color,
);