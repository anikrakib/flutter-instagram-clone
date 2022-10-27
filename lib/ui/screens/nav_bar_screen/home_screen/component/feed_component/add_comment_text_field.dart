import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/comment_post_button.dart';

TextField addCommentTextField({
  required TextEditingController textEditingController,
  required bool enabled,
}) {
  return TextField(
    enabled: enabled,
    controller: textEditingController,
    minLines: 1,
    maxLines: 10,
    style: const TextStyle(fontSize: 14),
    decoration: InputDecoration(
      suffix: PostButton(
        textEditingController: textEditingController,
      ),
      hintText: 'Add a comment...',
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: InputBorder.none,
    ),
  );
}
