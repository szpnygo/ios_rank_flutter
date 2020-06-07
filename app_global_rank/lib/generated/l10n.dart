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

  String get rank {
    return Intl.message(
      'Rank',
      name: 'rank',
      desc: '',
      args: [],
    );
  }

  String get function {
    return Intl.message(
      'Function',
      name: 'function',
      desc: '',
      args: [],
    );
  }

  String get look {
    return Intl.message(
      'Preview',
      name: 'look',
      desc: '',
      args: [],
    );
  }

  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  String get rate {
    return Intl.message(
      'Rate: ',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  String get company {
    return Intl.message(
      'Provider',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  String get age {
    return Intl.message(
      'Age Rating',
      name: 'age',
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