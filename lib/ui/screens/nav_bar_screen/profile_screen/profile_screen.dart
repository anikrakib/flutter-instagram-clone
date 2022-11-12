import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/ui/app_widgets/widgets.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/profile_screen/screen/all_profile_image_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/profile_screen/screen/all_tag_image_screen.dart';
import 'package:instagram_clone/ui/theme.dart';
import '../../../../app/data/profile_post_data.dart';
import '../../../../app/model/explore_data_model.dart';
import '../../../../utils/constants.dart';
import '../../../app_widgets/button.dart';
import 'component/required_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userInfo = GetStorage();
  String userName = '';
  String profilePic = '';
  bool tap = false;
  String posts = Random().nextInt(500).toString();
  String followers = Random().nextInt(500).toString();
  String following = Random().nextInt(500).toString();
  String name = Faker().person.name();
  bool showDiscoverPeople = false;
  List<ImageItem> allPostImage = generatePostImages();
  List<ImageItem> allTagImage = generateTagImages();

  @override
  void initState() {
    if (userInfo.read(userNameKey) != null &&
        userInfo.read(userProfilePicKey) != null) {
      userName = userInfo.read(userNameKey);
      profilePic = userInfo.read(userProfilePicKey);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context: context, userName: userName),
      body: DefaultTabController(
        length: 2,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: NestedScrollView(
            headerSliverBuilder: (context, _) {
              return [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      profileHeaderWidget(context),
                    ],
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                profileTabBar(context),
                Expanded(
                  child: TabBarView(
                    children: [
                      AllProfileImageScreen(
                        allPostImages: allPostImage,
                      ),
                      AllTagImageScreen(
                        allTagImages: allTagImage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileHeaderWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: defaultPadding, right: defaultPadding, bottom: defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeBox(10),
          profileHeaderTopSection(
            context: context,
            profilePic: profilePic,
            postNumber: posts,
            followerNumber: followers,
            followingNumber: following,
          ),
          sizeBox(10),
          Text(
            name,
            style: AppTextStyle.textStyleBold,
          ),
          sizeBox(5),
          profileBioExpandedText(bodyOnTapCallBack: postBodyOnTapCallBack),
          sizeBox(15),
          Row(
            children: [
              Expanded(
                child: customButton(
                  widget: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Edit profile',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              sizeBox(10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showDiscoverPeople = !showDiscoverPeople;
                  });
                },
                child: customButton(
                  width: 35,
                  widget: Icon(
                    Get.isDarkMode
                        ? Icons.person_add_outlined
                        : Icons.person_add,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          sizeBox(15),
          Visibility(
            visible: showDiscoverPeople,
            child: profileDiscoverPeopleSection(),
          ),
          profileHighLightSection()
        ],
      ),
    );
  }

  void postBodyOnTapCallBack(bool? isTapped) {
    if (isTapped != null) {
      setState(() {
        tap = isTapped;
      });
    }
  }
}
