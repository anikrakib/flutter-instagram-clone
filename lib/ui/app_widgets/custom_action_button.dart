import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

SizedBox customActionButton(Widget widget, bool disOrAn, [Function? action]) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: disOrAn == true
          ? () {
              if (action != null) {
                action();
              }
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

IconButton iconButtonWidget({required VoidCallback  function, Color? color, required String iconPath}) {
  return IconButton(
    onPressed: function,
    icon: SvgPicture.asset(
      iconPath,
      height: 22,
      width: 22,
      color: color,
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
