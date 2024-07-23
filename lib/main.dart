import 'package:ethio_duolingo/constants/my_theme.dart';
import 'package:ethio_duolingo/data/local/sqlite.dart';
import 'package:ethio_duolingo/flavor.dart';
import 'package:ethio_duolingo/locator.dart';
import 'package:ethio_duolingo/models/user.dart';
import 'package:ethio_duolingo/routes/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ethio_duolingo/constants/my_string.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(DevicePreview(
    enabled: flavor == FlavorEnum.PROD
        ? false
        : true, // Ensures that it is disabled in release mode
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      initialData: User.initial(),
      create: (_) => locator<Sqlite>().userController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.theme,
        title: MyString.appName,
        routes: Routes.routes,
        initialRoute: PathRoute.splash,
      ),
    );
  }
}
