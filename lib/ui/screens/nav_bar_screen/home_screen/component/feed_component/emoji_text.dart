import 'package:flutter/material.dart';

Widget emojiText({
  double? size,
  required String emoji,
  required TextEditingController textEditingController,
}) {
  return GestureDetector(
    onTap: () {
      textEditingController.text = textEditingController.text + emoji;
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    },
    child: Text(
      emoji,
      style: TextStyle(fontSize: size ?? 24),
    ),
  );
}
