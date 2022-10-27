import 'package:flutter/material.dart';
import '../../../../../theme.dart';

class PostButton extends StatefulWidget {
  const PostButton({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  State<PostButton> createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  final fadedTextStyle =
  AppTextStyle.textStyleActionBlue.copyWith(color: Colors.grey);
  late TextStyle textStyle = fadedTextStyle;

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(() {
      if (widget.textEditingController.text.isNotEmpty) {
        textStyle = AppTextStyle.textStyleActionBlue;
      } else {
        textStyle = fadedTextStyle;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //widget.onSubmitted(widget.textEditingController.text);
      },
      child: Positioned(
        top: 1,
        bottom: 1,
        child: Text(
          'Post',
          style: textStyle,
        ),
      ),
    );
  }
}