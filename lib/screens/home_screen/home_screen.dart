import 'package:ethio_duolingo/data/network/api/posts_api.dart';
import 'package:ethio_duolingo/enums/view_state.dart';
import 'package:ethio_duolingo/screens/base_screen.dart';
import 'package:ethio_duolingo/screens/home_screen/widgets/home_app_bar.dart';
import 'package:ethio_duolingo/screens/home_screen/widgets/home_banner.dart';
import 'package:ethio_duolingo/screens/home_screen/widgets/home_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen<PostsApi>(
      initState: (model) => model.getPosts(),
      builder: (_, model, __) => Scaffold(
        body: model.state == ViewState.BUSY
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: <Widget>[
                  HomeBanner(),
                  HomeAppBar(),
                  HomeList(),
                ],
              ),
      ),
    );
  }
}
