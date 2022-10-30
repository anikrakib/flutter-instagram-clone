import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/model/explore_data_model.dart';
import '../../../app/data/explorer_data.dart';
import 'component/image_item_custom_list_tile.dart';
import 'component/video_item_custom_list_tile.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<SearchListItem> exploreItems = [];
  var arguments = Get.arguments;
  int currentItemPosition = 0;

  @override
  void initState() {
    super.initState();
    exploreItems.add(arguments[0]);
    List<SearchListItem> items = explorerList;
    items.removeAt(currentItemPosition);
    //items.shuffle();
    exploreItems.addAll(items);
    currentItemPosition = arguments[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
           const SliverAppBar(
            floating: true,
            title: Text('Explore'),
          )
        ],
        body:NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: exploreItems.length,
            itemBuilder: (context, index) {
              final item = exploreItems[index];
              if (item is ImageItem) {
                return ImageItemWidget(imageItem: item);
              }
              else if (item is VideoItem) {
                return VideoItemWidget(videoItem: item);
              }
              else if (item is ReelItem) {
                return VideoItemWidget(reelItem: item);
              }
              return const ListTile(
                title: Text('Cant Find Anything'),
              );
            },
          ),
        ),
      ),
    );
  }
}
