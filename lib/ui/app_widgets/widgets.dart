import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import '../theme.dart';

SizedBox sizeBox(double size) => SizedBox(
      width: size,
      height: size,
    );

Container shadowFullScreen() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black.withOpacity(0.3),
          Colors.transparent,
        ],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        tileMode: TileMode.repeated,
      ),
    ),
  );
}

Row buildFeaturesRow({required String path, String text = '', double padding = 5.0}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 35,
        width: 35,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: svgImage(path),
        ),
      ),
      sizeBox(10),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.light,
          ),
        ),
      ),
    ],
  );
}
