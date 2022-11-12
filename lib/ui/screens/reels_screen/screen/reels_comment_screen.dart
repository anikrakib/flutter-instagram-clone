import 'package:flutter/material.dart';
import 'package:instagram_clone/app/model/explore_data_model.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/comment_screen/comments_screen.dart';
import 'package:video_player/video_player.dart';
import '../../../../utils/constants.dart';
import '../../../app_widgets/app_image.dart';
import '../../../app_widgets/widgets.dart';
import '../../../theme.dart';

class ReelsCommentScreen extends StatelessWidget {
  const ReelsCommentScreen(
      {Key? key, required this.controller, required this.reelItem})
      : super(key: key);
  final VideoPlayerController controller;
  final ReelItem reelItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.dark,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * .33,
                  height: MediaQuery.of(context).size.height * .30,
                  color: AppColors.dark,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: ((controller.value.size.height * .33) <
                                  MediaQuery.of(context).size.height)
                              ? controller.value.size.height * .33
                              : MediaQuery.of(context).size.height,
                          child: Hero(
                              tag: 'videoPlayer',
                              child: VideoPlayer(controller)),
                        ),
                      ),
                      shadowFullScreen(),
                      reelsBottomPart(context),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Comments(
                allComments: reelItem.comments,
                userImage: reelItem.reelUser.profileImageUrl,
                userName: reelItem.reelUser.userName,
                body: reelItem.reelPostBody,
              ),
            )
          ],
        ),
      ),
    );
  }

  Column reelsBottomPart(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              sizeBox(defaultPadding / 3),
              Flexible(
                flex: 10,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          postHeaderImage(
                            height: 10,
                            width: 10,
                            imageUrl: reelItem.reelUser.profileImageUrl,
                          ),
                          sizeBox(5),
                          Text(
                            reelItem.reelUser.userName,
                            style: AppTextStyle.commentReelsTextStyle,
                          ),
                          sizeBox(2),
                        ],
                      ),
                      Expanded(
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowIndicator();
                            return true;
                          },
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: defaultPadding / 6,
                                  bottom: defaultPadding / 6,
                                  right: defaultPadding / 6,
                                  top: defaultPadding / 5),
                              child: Text(
                                '😍🍁🍂 Calm water pool with autumn leaves hidden away as the season begins to change! Filmed a few weeks ago up near Glennallen Alaska.'
                                '\n.\n.\n.\n.\n.\n.\n.\nMore @${reelItem.reelUser.userName}.'
                                '\n.\n.\nFor more info visit www.xyz.com'
                                '\n.\n.\n.\n#reels #calm #alaska #sunset #alaska #winter #snow #womanlifefreedom #زن_زندگی_آزادی #mahsa_amini #iraniangirl',
                                textAlign: TextAlign.justify,
                                maxLines: 2,
                                style: AppTextStyle.commentReelsTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.graphic_eq_outlined,
                            size: 8,
                            color: AppColors.light,
                          ),
                          Expanded(
                            child: Text(
                              reelItem.reelMusicName,
                              maxLines: 1,
                              style: AppTextStyle.commentReelsTextStyle,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              sizeBox(5),
                              const Icon(
                                Icons.location_on,
                                size: 8,
                                color: AppColors.light,
                              ),
                              Text(
                                reelItem.location,
                                style: AppTextStyle.commentReelsTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      sizeBox(5),
                    ],
                  ),
                ),
              ),
              sizeBox(5),
              reelsSideBar(context),
              sizeBox(defaultPadding / 3),
            ],
          ),
        ),
        sizeBox(5),
      ],
    );
  }

  Flexible reelsSideBar(BuildContext context) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .20,
        child: Column(
          children: [
            Expanded(
              child: svgImageWithColor(
                  8, 8, Assets.iconsIconHeart, AppColors.light),
            ),
            Expanded(
              child: Text(
                '${reelItem.like}k',
                style: AppTextStyle.commentReelsTextStyle,
              ),
            ),
            Expanded(
              child: svgImageWithColor(
                  8, 8, Assets.iconsIconComment, AppColors.light),
            ),
            Expanded(
              child: Text(
                '${reelItem.comments.length}',
                style: AppTextStyle.commentReelsTextStyle,
              ),
            ),
            Expanded(
              child: svgImageWithColor(
                  8, 8, Assets.iconsIconMessage, AppColors.light),
            ),
            Expanded(
              child: svgImageWithColor(
                  8, 8, Assets.iconsIconOptionVertical, AppColors.light),
            ),
            sizeBox(10),
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.light, width: 1),
                borderRadius: BorderRadius.circular(2),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    reelItem.reelUser.profileImageUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container shadowFullScreen() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.transparent,
          ],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      ),
    );
  }
}
