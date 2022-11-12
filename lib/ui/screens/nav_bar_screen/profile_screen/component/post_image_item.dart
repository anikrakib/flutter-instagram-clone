import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../app/model/explore_data_model.dart';
import '../../../../../generated/assets.dart';
import '../../../../app_widgets/app_image.dart';
import '../../../../theme.dart';

class PostImageItem extends StatelessWidget {
  const PostImageItem({
    Key? key,
    required this.allImages,
  }) : super(key: key);

  final ImageItem allImages;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: allImages.images.first,
            fit: BoxFit.cover,
          ),
        ),
        Visibility(
          visible: allImages.images.length != 1,
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
