import 'package:flutter/material.dart';

class CountryModel with ChangeNotifier {
  String _country = "cn";

  String country() {
    return _country;
  }

  void changeCountry(String n) {
    _country = n;
    notifyListeners();
  }
}
