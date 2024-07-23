import 'package:ethio_duolingo/data/network/api/posts_api.dart';
import 'package:ethio_duolingo/screens/home_screen/widgets/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CourseItem(
            index: index,
          );
        },
        childCount: Provider.of<PostsApi>(context).posts.length,
      ),
    );
  }
}
