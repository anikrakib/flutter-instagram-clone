import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme.dart';

ElevatedButton followButton([Color? color, double? fontSize]) {
  return ElevatedButton(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        color ?? AppColors.light,
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        (color == null) ? AppColors.secondary : Colors.transparent,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: color ?? AppColors.secondary,
          ),
        ),
      ),
    ),
    onPressed: () => {},
    child: Text(
      "Follow".toUpperCase(),
      style: TextStyle(
        fontSize: fontSize ?? 12,
      ),
    ),
  );
}

Container customButton({
  required Widget widget,
  double width = double.infinity,
}) {
  return Container(
    height: 30,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Get.isDarkMode ? const Color(0xff272627) : const Color(0xffeeefee),
    ),
    child: widget,
  );
}
