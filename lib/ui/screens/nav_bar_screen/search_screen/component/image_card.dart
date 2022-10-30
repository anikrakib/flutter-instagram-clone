import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/model/explore_data_model.dart';
import '../../../../../generated/assets.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../app_widgets/app_image.dart';
import '../../../../theme.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.imageItem,
    required this.index,
  }) : super(key: key);
  final ImageItem imageItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.explore,
          arguments: [
            imageItem,
            index,
          ]
        );
      },
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: imageItem.images.first,
              fit: BoxFit.cover,
            ),
          ),
          Visibility(
            visible: imageItem.images.length != 1,
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
      ),
    );
  }
}
