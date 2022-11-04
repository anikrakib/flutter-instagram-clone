import 'package:flutter/material.dart';
import 'package:instagram_clone/app/data/explorer_data.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../app/model/explore_data_model.dart';
import '../../../generated/assets.dart';
import '../../app_widgets/custom_action_button.dart';
import 'component/individual_reels_item.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({Key? key, required this.reelItem}) : super(key: key);
  final ReelItem reelItem;

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  List<ReelItem> lists = [];

  @override
  void initState() {
    lists.add(widget.reelItem);
    lists.addAll(reelsList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.light, //change your color here
        ),
        title: const Text(
          'Reels',
          style: TextStyle(color: AppColors.light),
        ),
        actions: [
          iconButtonWidget(
            function: () {},
            color: AppColors.light,
            iconPath: Assets.iconsIconCamera,
          ),
          sizeBox(defaultPadding / 2),
        ],
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: controller,
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return Container(
            color: Theme.of(context).primaryColor,
            child: IndividualReelItem(reelItem: lists[index]),
          );
        },
      ),
    );
  }
}
