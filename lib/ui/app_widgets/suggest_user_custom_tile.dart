import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../app/model/view_type.dart';
import '../theme.dart';
import 'button.dart';

SizedBox suggestUserCustomListTile(SuggestUser user) {
  return SizedBox(
    height: 250,
    width: 170,
    child: Card(
      elevation: 5,
      margin: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    user.userImage,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user.userName,
                style: AppTextStyle.textStyleSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 25,
                width: 120,
                child: followButton(),
              )
            ],
          ),
          const Positioned(
            right: 5,
            top: 5,
            child: Icon(
              CupertinoIcons.multiply,
              size: 20,
            ),
          ),
        ],
      ),
    ),
  );
}
