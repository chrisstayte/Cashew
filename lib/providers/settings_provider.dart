import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/bill_sorting_method.dart';
import 'package:cashew/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  SharedPreferences? prefs;

  SettingsProvider() {
    setup();
  }

  void setup() async {
    prefs = await SharedPreferences.getInstance();

    _isDarkMode = prefs?.getBool('isDarkMode') ?? false;

    notifyListeners();
  }

  BillSortingMethod getBillTypeSortingMethod(BillType billType) {
    return BillSortingMethod.values.byName(
        prefs?.getString('${billType.name}TypeSortingMethod') ??
            BillSortingMethod.dateCreatedAscending.name);
  }

  void setBillTypeCardSortingMethod(
      BillType billType, BillSortingMethod value) async {
    await prefs?.setString('${billType.name}TypeSortingMethod', value.name);
    notifyListeners();
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void setIsDarkMode(bool value) async {
    _isDarkMode = value;
    await prefs?.setBool('isDarkMode', value);
    notifyListeners();
  }
}
