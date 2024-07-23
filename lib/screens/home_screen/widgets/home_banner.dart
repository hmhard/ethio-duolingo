import 'package:ethio_duolingo/constants/my_colors.dart';
import 'package:ethio_duolingo/constants/my_images.dart';
import 'package:ethio_duolingo/constants/my_sizes.dart';
import 'package:ethio_duolingo/data/local/sqlite.dart';
import 'package:ethio_duolingo/locator.dart';
import 'package:ethio_duolingo/models/user.dart';
import 'package:ethio_duolingo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: MyColors.lightGrey,
        padding: EdgeInsets.only(
          left: MySize.paddingWidthMedium,
          top: 40.h,
          right: MySize.paddingWidthMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome,",
                      style: TextStyle(
                          fontSize: MySize.fontLarge,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(Provider.of<User>(context).name,
                        style: TextStyle(
                            fontSize: MySize.fontLarge,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    locator<Sqlite>().deleteUser();
                    Routes.pushReplace(context, PathRoute.login);
                  },
                  child: CircleAvatar(
                    radius: 30.w,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      MyImages.avatar1,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MySize.paddingHeightLarge,
            ),
            TextFormField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontSize: MySize.fontDefault,
              ),
              decoration: InputDecoration(
                hintText: "Search Course",
                fillColor: MyColors.white,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: MySize.paddingWidthMedium),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search,
                  color: MyColors.darkGrey,
                  size: MySize.iconDefault,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
