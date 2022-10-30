import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../generated/assets.dart';
import '../../../../app_widgets/app_image.dart';
import '../../../../theme.dart';

AppBar searchScreenAppBar(BuildContext context) {
  return AppBar(
    title: SizedBox(
      height: 40,
      child: TextFormField(
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Get.isDarkMode
              ? const Color(0xff272627)
              : const Color(0xffeeefee),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: svgImageWithColor(
              15,
              15,
              Assets.bottomNavbarIconSearchFill,
              AppColors.faded,
            ), // icon is 48px widget.
          ),
          hintText: 'Search...',
          hintStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.faded,
          ),
        ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: navigationSVGImage(context, Assets.iconsIconScanner),
      ),
    ],
  );
}
