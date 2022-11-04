import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/app_widgets/custom_action_button.dart';
import 'package:instagram_clone/ui/theme.dart';
import '../../../../utils/constants.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late String currentState;
  late int currentIndex;

  @override
  void initState() {
    currentState = "POST";
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New post'),
        leading: iconButtonWidget(
          function: () {
            Get.back();
          },
          iconPath: Assets.iconsIconCross,
          color: Theme.of(context).primaryColor,
        ),
        actions: [
          iconButtonWidget(
            function: () {},
            iconPath: Assets.iconsIconForward,
            color: AppColors.secondary,
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: newPostPages[currentIndex],
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: MediaQuery.of(context).size.width * 0.4,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              right: 0,
              left: 0,
              child: SizedBox(
                height: 35,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 60,
                    diameterRatio: 5,
                    /*useMagnifier: true,
                    magnification: 1.5,*/
                    //* selected state is magnified
                    onSelectedItemChanged: (index) {
                      setState(
                        () {
                          currentState = lists[index];
                          if (currentState == 'POST') {
                            currentIndex = 0;
                          } else if (currentState == 'STORY') {
                            currentIndex = 1;
                          } else if (currentState == 'REEL') {
                            currentIndex = 2;
                          } else if (currentState == 'LIVE') {
                            currentIndex = 3;
                          }
                        },
                      );
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: lists.length,
                      builder: (context, index) {
                        return RotatedBox(
                          quarterTurns: 1,
                          child: WheelTile(
                            lists[index],
                            currentState == lists[index]
                                ? const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.normal,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WheelTile extends StatelessWidget {
  final String states;
  final TextStyle style;

  const WheelTile(this.states, this.style, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(states, textAlign: TextAlign.start, style: style),
    );
  }
}
