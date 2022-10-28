import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/assets.dart';
import '../../../../app_widgets/app_image.dart';
import '../../../../theme.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.images,
    required this.index,
  }) : super(key: key);
  final List<String> images;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: images.first,
            fit: BoxFit.cover,
          ),
        ),
        Visibility(
          visible: images.length != 1,
          child: Positioned(
            top: 8,
            right: 8,
            child: navigationSVGImage(
              context,
              Assets.iconsIconMultipleImage,
              17,
                AppColors.light,
            ),
          ),
        ),
      ],
    );
  }
}
