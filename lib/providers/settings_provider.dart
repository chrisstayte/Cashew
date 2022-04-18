import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/bill_type_card_sorting_method.dart';
import 'package:cashew/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  late SharedPreferences prefs;

  SettingsProvider() {
    setup();
  }

  void setup() async {
    prefs = await SharedPreferences.getInstance();

    _isDarkMode = prefs.getBool('isDarkMode') ?? false;

    notifyListeners();
  }

  BillTypeCardSortingMethod getBillTypeCardSortingMethod(BillType billType) {
    return BillTypeCardSortingMethod.values.byName(
        prefs.getString('${billType.name}SortingMethod') ??
            BillTypeCardSortingMethod.dateCreatedAscending.name);
  }

  void setBillTypeCardSortingMethod(
      BillType billType, BillTypeCardSortingMethod value) async {
    await prefs.setString('${billType.name}SortingMethod', value.name);
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void setIsDarkMode(bool value) async {
    _isDarkMode = value;
    await prefs.setBool('isDarkMode', value);
    notifyListeners();
  }
}
