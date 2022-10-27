import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../theme.dart';

Widget postBodyText(String? userName, {required String post}) {
  return RichText(
    textAlign: TextAlign.start,
    maxLines: 2,
    text: TextSpan(
      text: '$userName ',
      style: TextStyle(
        color: Get.isDarkMode ? AppColors.light : AppColors.dark,
        fontWeight: FontWeight.w900,
        fontSize: 13,
      ),
      children: [
        TextSpan(
          text: post.toString(),
          style: AppTextStyle.textStyleSmall,
        )
      ],
    ),
  );
}
