import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/app/data/user_data.dart';
import 'package:instagram_clone/app/model/user_model.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/story_screen/story_screen.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'component/home_screen_app_bar.dart';
import 'component/user_story_design.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  late List<User> users;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userInfo = GetStorage();
  String userImage = '';

  @override
  void initState() {
    super.initState();
    widget.users = userList;
    if (userInfo.read(userProfilePicKey) != null) {
      userImage = userInfo.read(userProfilePicKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeScreenAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    yourStory(context, userImage),
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: widget.users.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              List<User> newUsers = [];
                              for (int i = index;
                                  i < widget.users.length;
                                  i++) {
                                newUsers.add(widget.users[i]);
                              }
                              Get.to(
                                StoryScreen(users: newUsers),
                              );
                            },
                            child: othersUserStory(
                              context,
                              widget.users[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
