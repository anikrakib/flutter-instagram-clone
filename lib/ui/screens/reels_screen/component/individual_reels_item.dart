import 'package:expandable_text/expandable_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/app/model/explore_data_model.dart';
import 'package:instagram_clone/ui/screens/reels_screen/component/reels_side_bar.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:marquee/marquee.dart';
import 'package:video_player/video_player.dart';
import '../../../../utils/constants.dart';
import '../../../app_widgets/app_image.dart';
import '../../../app_widgets/follow_button.dart';
import '../../../app_widgets/sizeBox.dart';

class IndividualReelItem extends StatefulWidget {
  const IndividualReelItem({Key? key, required this.reelItem})
      : super(key: key);
  final ReelItem reelItem;

  @override
  State<IndividualReelItem> createState() => _IndividualReelItemState();
}

class _IndividualReelItemState extends State<IndividualReelItem> {
  late VideoPlayerController videoController;
  bool tap = false;

  @override
  void initState() {
    videoController = VideoPlayerController.network('')
      ..initialize().then((_) {
        setState(() {});
      });
    _loadStory(url: widget.reelItem.reelUrl);
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            height: (videoController.value.size.height <
                    MediaQuery.of(context).size.height)
                ? videoController.value.size.height
                : MediaQuery.of(context).size.height,
            width: (videoController.value.size.width <
                    MediaQuery.of(context).size.width)
                ? videoController.value.size.width
                : MediaQuery.of(context).size.width,
            child: (videoController.value.isInitialized)
                ? VideoPlayer(videoController)
                : Container(),
          ),
        ),
        Container(
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
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.transparent,
              ],
              end: FractionalOffset.topCenter,
              begin: FractionalOffset.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                sizeBox(defaultPadding / 2),
                Flexible(
                  flex: 12,
                  child: SizedBox(
                    height: tap
                        ? MediaQuery.of(context).size.height * .50
                        : MediaQuery.of(context).size.height * .20,
                    child: reelBottomPart(),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .45,
                    child: ReelSideBar(widget: widget),
                  ),
                ),
                sizeBox(defaultPadding / 2),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Column reelBottomPart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          //dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: defaultPadding / 2,
          title: Row(
            children: [
              Text(
                widget.reelItem.reelUser.userName,
                style: AppTextStyle.reelsTextStyle,
              ),
              sizeBox(10),
              SizedBox(
                height: 30,
                width: 80,
                child: followButton(AppColors.light),
              ),
            ],
          ),
          leading: postHeaderImage(
              imageUrl: widget.reelItem.reelUser.profileImageUrl),
        ),
        Expanded(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding,
                  bottom: defaultPadding,
                  right: defaultPadding / 2,
                ),
                child: ExpandableText(
                  '😍🍁🍂 Calm water pool with autumn leaves hidden away as the season begins to change! Filmed a few weeks ago up near Glennallen Alaska.'
                  '\n.\n.\n.\n.\n.\n.\n.\nMore @${widget.reelItem.reelUser.userName}.'
                  '\n.\n.\nFor more info visit www.xyz.com'
                  '\n.\n.\n.\n#reels #calm #alaska #sunset #alaska #winter #snow #womanlifefreedom #زن_زندگی_آزادی #mahsa_amini #iraniangirl',
                  expandText: '...more',
                  collapseText: '...hide',
                  collapseOnTextTap: true,
                  expandOnTextTap: true,
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
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  onExpandedChanged: postBodyOnTapCallBack,
                  style: AppTextStyle.reelsTextStyle,
                ),
              ),
            ),
          ),
        ),
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 5,
          title: SizedBox(
            height: 20,
            child: Row(
              children: [
                Expanded(
                  child: Marquee(
                    text: widget.reelItem.reelMusicName,
                    //scrollAxis: Axis.horizontal,
                    //velocity: 8,
                    style: AppTextStyle.reelsTextStyle,
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 50.0,
                    startPadding: 10.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sizeBox(5),
                      const Icon(
                        Icons.location_on,
                        size: 15,
                        color: AppColors.light,
                      ),
                      Text(
                        Faker().person.lastName(),
                        style: AppTextStyle.reelsTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          leading: const Icon(
            Icons.graphic_eq_outlined,
            size: 15,
            color: AppColors.light,
          ),
        )
      ],
    );
  }

  void postBodyOnTapCallBack(bool? isTapped) {
    if (isTapped != null) {
      setState(() {
        tap = isTapped;
      });
    }
  }

  void _loadStory({required String url}) {
    videoController.dispose();
    videoController = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {});
        if (videoController.value.isInitialized) {
          videoController.play();
        }
      });
    videoController.setLooping(true);
  }
}
