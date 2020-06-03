import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rank/ui/app_page.dart';
import 'package:rank/ui/detail_page.dart';

void main() {
  runApp(MyApp());
  SystemUiOverlayStyle style = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iOS全球应用排行榜',
      theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
          accentColor: Colors.white,
          scaffoldBackgroundColor: Colors.white),
      initialRoute: AppPage.routeName,
      routes: {
        AppPage.routeName: (BuildContext context) => AppPage(),
      },
    );
  }
}
