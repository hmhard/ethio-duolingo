import 'package:ethio_duolingo/constants/my_colors.dart';
import 'package:ethio_duolingo/constants/my_sizes.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: MyColors.lightGrey,
      pinned: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Recomended Course",
            style: TextStyle(
                color: MyColors.black,
                fontSize: MySize.fontDefault,
                fontWeight: FontWeight.w700),
          ),
          Text(
            "Sell All",
            style: TextStyle(
                color: MyColors.primary,
                decoration: TextDecoration.underline,
                fontSize: MySize.fontDefault,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
