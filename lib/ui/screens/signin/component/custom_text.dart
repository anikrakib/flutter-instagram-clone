import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../theme.dart';

RichText customText(String text1, String text2) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: AppTextStyle.textStyleFadedSmall,
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (text2 == "Log In") {
                Get.offNamed(Routes.SIGNIN);
              } else if (text2 == "Sign Up") {
                Get.offNamed(Routes.SIGNUP);
              }
            },
          text: text2,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Get.isDarkMode ? AppColors.light : AppColors.dark,
          ),
        ),
      ],
    ),
  );
}
