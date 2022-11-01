import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/app/data/explorer_data.dart';
import '../../../../app/model/explore_data_model.dart';
import 'component/image_card.dart';
import 'component/reels_card.dart';
import 'component/search_screen_app_bar.dart';
import 'component/video_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchScreenAppBar(context),
      body: SafeArea(
        child: explorerGridView(),
      ),
    );
  }

  Widget explorerGridView() {
    var pointer = 2;
    var increment = 9;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: explorerList.length,
        itemBuilder: (context, index) {
          final item = explorerList[index];
          if (item is ImageItem) {
            return ImageCard(
              imageItem: item,
              index: index,
            );
          } else if (item is ReelItem) {
            return ReelsCard(reelItem: item);
          } else if (item is VideoItem) {
            return VideoCard(
              videoItem: item,
              currentPosition: index,
            );
          }
          return const ListTile(
            title: Text('Cant Find Anything'),
          );
        },
        staggeredTileBuilder: (index) {
          if (index == 0) {
            pointer = 2;
            increment = 9;
          }
          if (index == pointer) {
            pointer += increment;
            if (increment == 9) {
              increment = 13;
            } else if (increment == 13) {
              increment = 9;
            }
            return const StaggeredTile.count(1, 2);
          } else {
            return const StaggeredTile.count(1, 1);
          }
        },
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
    );
  }
}
