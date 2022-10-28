import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/app/data/explorer_data.dart';
import '../../../../app/model/explore_data_model.dart';
import 'component/image_card.dart';
import 'component/reels_card.dart';
import 'component/search_screen_app_bar.dart';
import 'component/video_card.dart';

var lst = [2, 11, 24, 33, 46, 55, 68, 77, 90, 99, 112];

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
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: explorerList.length,
      itemBuilder: (context, index) {
        final item = explorerList[index];
        if (item is ImageItem) {
          return ImageCard(
            images: item.images,
            index: index,
          );
        } else if (item is ReelItem) {
          return ReelsCard(reelsUrl: item.reelUrl);
        }
        else if (item is VideoItem) {
          return VideoCard(videoUrl: item.videoUrl);
        }
        return const ListTile(
          title: Text('Cant Find Anything'),
        );
      },
      /*staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 2 == 0) ? 1 : 1,
          (index % 11 == 0) ? 2 : 1),*/
      staggeredTileBuilder: (index) {
        /*if (index != 0 && ((index % 2 == 0) || (index % 11 == 0))) {
            if ((((index - value) == 9 && right) ||
                ((index - value) == 13 && left)) ||
                index == 2) {
              value = index;
              */ /*right = !right;
              left = !left;*/ /*
              return const StaggeredTile.count(1, 2);
            }else{
              return const StaggeredTile.count(1, 1);
            }
          }else{
            return const StaggeredTile.count(1, 1);
          }*/
        if (lst.contains(index)) {
          return const StaggeredTile.count(1, 2);
        } else {
          return const StaggeredTile.count(1, 1);
        }
      },
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
    );
  }
}
