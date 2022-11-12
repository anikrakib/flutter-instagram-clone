import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/app/model/explore_data_model.dart';
import '../component/post_image_item.dart';

class AllProfileImageScreen extends StatelessWidget {
  const AllProfileImageScreen({
    Key? key,
    required this.allPostImages,
  }) : super(key: key);
  final List<ImageItem> allPostImages;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: allPostImages.length,
        itemBuilder: (context, index) {
          return PostImageItem(allImages: allPostImages[index]);
        },
        staggeredTileBuilder: (index) {
          return const StaggeredTile.count(1, 1);
        },
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
    );
  }
}
