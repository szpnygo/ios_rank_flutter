// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get appName {
    return Intl.message(
      'NewApp',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  String get newApp {
    return Intl.message(
      'NewApp',
      name: 'newApp',
      desc: '',
      args: [],
    );
  }

  String get newGame {
    return Intl.message(
      'NewGame',
      name: 'newGame',
      desc: '',
      args: [],
    );
  }

  String get topFree {
    return Intl.message(
      'TopFree',
      name: 'topFree',
      desc: '',
      args: [],
    );
  }

  String get topGrossing {
    return Intl.message(
      'TopGrossing',
      name: 'topGrossing',
      desc: '',
      args: [],
    );
  }

  String get topPaid {
    return Intl.message(
      'TopPaid',
      name: 'topPaid',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}