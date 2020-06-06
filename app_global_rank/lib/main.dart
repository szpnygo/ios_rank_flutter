import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rank/generated/l10n.dart';
import 'package:rank/model/country.dart';
import 'package:rank/ui/app_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CountryModel(),
      )
    ],
    child: MyApp(),
  ));

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
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).appName,
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
