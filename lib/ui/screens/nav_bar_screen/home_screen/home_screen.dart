import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/component/feed_component/suggest_user_custom_list.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/story_screen/story_screen.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../../app/data/feed_data.dart';
import '../../../../app/data/user_data.dart';
import '../../../../app/model/user_model.dart';
import '../../../../app/model/view_type.dart';
import 'component/feed_component/add_item_custom_list_tile.dart';
import 'component/feed_component/post_item_custom_list_tile.dart';
import 'component/home_screen_app_bar.dart';
import 'component/user_story_design.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userInfo = GetStorage();
  late List<User> users;
  late List<ListItem> items;
  String userImage = '';
  final faker = Faker();
  final random = Random();

  @override
  void initState() {
    super.initState();
    users = userList;
    items = postList;
    if (users.isNotEmpty && items.isNotEmpty) {
      users.shuffle();
      //items.shuffle();
    }
    if (userInfo.read(userProfilePicKey) != null) {
      userImage = userInfo.read(userProfilePicKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeScreenAppBar(context),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: myDayPart(context),
                ),
                Divider(
                  thickness: 0.1,
                  color: Theme.of(context).primaryColor,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    if (item is AddItem) {
                      return AddItemWidget(item: item);
                    } else if (item is PostItem) {
                      return PostItemWidget(postItem: item);
                    } else if (item is SuggestUsers) {
                      return SuggestUserWidget(suggestUser: item.suggestUsers);
                    }
                    return const ListTile(
                      title: Text('Cant Find Anything'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView myDayPart(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          yourStory(context, userImage),
          SizedBox(
            height: 95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    List<User> newUsers = [];
                    for (int i = index; i < users.length; i++) {
                      newUsers.add(users[i]);
                    }
                    Get.to(
                      StoryScreen(users: newUsers),
                    );
                  },
                  child: othersUserStory(
                    context,
                    users[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
