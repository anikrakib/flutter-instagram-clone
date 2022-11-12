import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../../app/model/explore_data_model.dart';
import '../component/post_image_item.dart';

class AllTagImageScreen extends StatelessWidget {
  const AllTagImageScreen({Key? key, required this.allTagImages})
      : super(key: key);
  final List<ImageItem> allTagImages;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: allTagImages.length,
        itemBuilder: (context, index) {
          return PostImageItem(allImages: allTagImages[index]);
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
