import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

SizedBox customActionButton(Widget widget, bool disOrAn,
    [String? routes,]) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: disOrAn == true
          ? () {
              Get.toNamed(routes!);
            }
          : null,
      style: disOrAn == true ? buttonEnableStyle() : buttonDisableStyle(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget,
      ),
    ),
  );
}

ButtonStyle buttonDisableStyle() {
  return ElevatedButton.styleFrom(
    foregroundColor: const Color(0xFF3797EF),
    disabledForegroundColor: const Color(0xFF3797EF).withOpacity(0.38),
    disabledBackgroundColor: const Color(0xFF3797EF).withOpacity(0.12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

ButtonStyle buttonEnableStyle() {
  return ElevatedButton.styleFrom(
    foregroundColor: const Color(0xFF3797EF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
