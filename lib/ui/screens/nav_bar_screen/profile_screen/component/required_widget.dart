import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/data/feed_data.dart';
import '../../../../../app/data/profile_highlight_data.dart';
import '../../../../../generated/assets.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/constants.dart';
import '../../../../app_widgets/app_image.dart';
import '../../../../app_widgets/custom_action_button.dart';
import '../../../../app_widgets/suggest_user_custom_tile.dart';
import '../../../../app_widgets/widgets.dart';
import '../../../../theme.dart';

Widget profileHighLightSection() {
  return SizedBox(
    height: 100,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: highlightItems.length + 1,
      itemBuilder: (context, index) {
        return (highlightItems.length == index)
            ? highLightAddTile(context)
            : Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.faded,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(highlightItems[index].thumbnail),
                            radius: 28,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          highlightItems[index].title,
                          style: const TextStyle(fontSize: 13),
                        ),
                      )
                    ],
                  ),
                  sizeBox(20),
                ],
              );
      },
    ),
  );
}

Column profileDiscoverPeopleSection() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Discover people'),
          Text(
            'See All',
            style: AppTextStyle.textStyleActionBlue,
          ),
        ],
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var suggestUser in suggestUsers)
              suggestUserCustomListTile(suggestUser)
          ],
        ),
      ),
      sizeBox(20),
    ],
  );
}

Row profileHeaderTopSection({
  required BuildContext context,
  required String profilePic,
  required String postNumber,
  required String followerNumber,
  required String followingNumber,
}) {
  return Row(
    children: [
      SizedBox(
        height: myDayProfilePicSize + 15,
        width: myDayProfilePicSize + 15,
        child: profileCircleAvatar(
          context: context,
          imageUrl: profilePic,
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(postNumber, style: AppTextStyle.profilePageLargeFontStyle),
                const Text('Posts',
                    style: AppTextStyle.profilePageMediumFontStyle),
              ],
            ),
            Column(
              children: [
                Text(followerNumber,
                    style: AppTextStyle.profilePageLargeFontStyle),
                const Text('Followers',
                    style: AppTextStyle.profilePageMediumFontStyle),
              ],
            ),
            Column(
              children: [
                Text(followingNumber,
                    style: AppTextStyle.profilePageLargeFontStyle),
                const Text('Following',
                    style: AppTextStyle.profilePageMediumFontStyle),
              ],
            )
          ],
        ),
      )
    ],
  );
}

AppBar profileAppBar({
  required BuildContext context,
  required String userName,
}) {
  return AppBar(
    title: Row(
      children: [
        svgImageWithColor(
          15,
          15,
          Assets.iconsIconLock,
          Theme.of(context).primaryColor,
        ),
        sizeBox(10),
        Text(userName, style: AppTextStyle.profilePageLargeFontStyle),
        sizeBox(10),
        svgImageWithColor(
          15,
          15,
          Assets.assetsProfileVerified,
          AppColors.secondary,
        ),
        sizeBox(10),
        svgImageWithColor(
          6,
          6,
          Assets.iconsIconArrowDown,
          Theme.of(context).primaryColor,
        ),
      ],
    ),
    actions: [
      iconButtonWidget(
        function: () {},
        iconPath: Assets.bottomNavbarIconPost,
        color: Theme.of(context).primaryColor,
      ),
      iconButtonWidget(
        function: () {
          Get.bottomSheet(
            Container(
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? const Color(0xff272627)
                    : const Color(0xffeeefee),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Container(
                      height: 4,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.isDarkMode
                            ? const Color(0xffeeefee)
                            : AppColors.faded,
                      ),
                    ),
                    sizeBox(20),
                    iconAndTextListTile(
                      context,
                      'Settings',
                      path: Assets.iconsIconSetting,
                      routesPath: Routes.settings,
                    ),
                    sizeBox(20),
                    iconAndTextListTile(
                        context, 'Your activity', path: Assets.iconsIconYourActivity),
                    sizeBox(20),
                    iconAndTextListTile(
                        context, 'Archive', path: Assets.iconsIconArchive),
                    sizeBox(20),
                    iconAndTextListTile(
                        context, 'QR code', path: Assets.iconsIconScanner),
                    sizeBox(20),
                    iconAndTextListTile(
                        context, 'Saved', path: Assets.iconsIconBookmark),
                    sizeBox(20),
                    iconAndTextListTile(
                        context, 'Close Friends', path: Assets.iconsIconCloseFriends),
                    sizeBox(20),
                    iconAndTextListTile(
                        context, 'Favorites', icons: Icons.star_border_purple500_sharp),
                    sizeBox(20),
                    iconAndTextListTile(
                        context, 'Update messaging', path: Assets.iconsIconMessenger),
                  ],
                ),
              ),
            ),
            enableDrag: true,
          );
        },
        iconPath: Assets.iconsIconMenu,
        color: Theme.of(context).primaryColor,
      ),
      sizeBox(10),
    ],
  );
}

TabBar profileTabBar(BuildContext context) {
  return TabBar(
    labelColor: Theme.of(context).primaryColor,
    unselectedLabelColor: AppColors.faded,
    indicatorColor: Theme.of(context).primaryColor,
    tabs: [
      Tab(
        icon: svgImageWithColor(
          22,
          22,
          Assets.iconsIconGrid,
          Theme.of(context).primaryColor,
        ),
      ),
      Tab(
        icon: svgImageWithColor(
          22,
          22,
          Assets.iconsIconTag,
          Theme.of(context).primaryColor,
        ),
      ),
    ],
  );
}

ExpandableText profileBioExpandedText({required var bodyOnTapCallBack}) {
  return ExpandableText(
    'Color Lover | Pattern Mixer | Trend Ignorer | Budget Stretcher 🛠. \n@tasha.kaleidoscope\nwww.instagram.com',
    expandText: '...more',
    collapseOnTextTap: true,
    textAlign: TextAlign.justify,
    expandOnTextTap: true,
    maxLines: 3,
    linkColor: const Color(0xFF00376B),
    urlStyle: const TextStyle(
      decoration: TextDecoration.underline,
    ),
    hashtagStyle: const TextStyle(
      color: Color(0xFF00376B),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    mentionStyle: const TextStyle(
      color: Color(0xFF00376B),
      fontSize: 50,
      fontWeight: FontWeight.w400,
    ),
    onExpandedChanged: bodyOnTapCallBack,
    style: AppTextStyle.textStyleNormal,
  );
}

Column highLightAddTile(BuildContext context) {
  return Column(
    children: [
      Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(60),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              size: 30,
            ),
          )),
      sizeBox(10),
      const Text('New'),
    ],
  );
}
