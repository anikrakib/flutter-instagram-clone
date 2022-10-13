import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../generated/assets.dart';

SvgPicture appLogo(context) => SvgPicture.asset(Assets.assetsAppLogo,
    width: 180, height: 50, color: Theme.of(context).primaryColor);

SvgPicture appLogoForAppBar(context) => SvgPicture.asset(Assets.assetsAppLogo,
    width: 110, height: 30, color: Theme.of(context).primaryColor);

SvgPicture svgImage(double height, double width, String path) =>
    SvgPicture.asset(
      path,
      width: width,
      height: height,
      //color: Get.isDarkMode ? AppColors.light : AppColors.dark,
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
    height: 22,
    width: 22,
  );
}

SvgPicture navigationSVGImage(
  BuildContext context,
  String imagePath,
) {
  return SvgPicture.asset(
    imagePath,
    height: 22,
    width: 22,
    color: Theme.of(context).primaryColor,
  );
}

CircleAvatar profileCircleAvatarWithPadding({
  required BuildContext context,
  required String imageUrl,
  required double radius,
  required double padding,
}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: Theme.of(context).primaryColor,
    child: Padding(
      padding: EdgeInsets.all(padding), // Border radius
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

CircleAvatar profileCircleAvatar({
  required BuildContext context,
  required String imageUrl,
}) {
  return CircleAvatar(
    backgroundColor: Theme.of(context).primaryColor,
    child: ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
      ),
    ),
  );
}

SizedBox postHeaderImage(
    {double? height, double? width, required String imageUrl}) {
  return SizedBox(
    height: height ?? 40,
    width: width ?? 40,
    child: CircleAvatar(
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
