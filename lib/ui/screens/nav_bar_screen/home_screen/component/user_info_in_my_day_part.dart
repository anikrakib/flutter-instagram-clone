import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../app/model/user_model.dart';
import '../../../../theme.dart';

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15.0,
          backgroundColor: AppColors.faded,
          backgroundImage: CachedNetworkImageProvider(
            user.profileImageUrl,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            user.userName,
            style: const TextStyle(
              color: AppColors.light,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.ellipsis_vertical),
          color: AppColors.light,
          iconSize: 22,
          onPressed: () {},
        ),
      ],
    );
  }
}
