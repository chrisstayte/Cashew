import 'dart:collection';

import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/models/bill.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillProvider extends ChangeNotifier {
  static const String BoxName = 'bills';
  final Box box = Hive.box<Bill>(BoxName);

  List<Bill> _bills = [];
  UnmodifiableListView<Bill> get bills => UnmodifiableListView<Bill>(_bills);

  BillProvider() {
    getBills();
  }

  getBills() {
    _bills = box.values.toList() as List<Bill>;
    notifyListeners();
  }

  addBill(Bill bill) async {
    box.add(bill);
    _bills.add(bill);
    notifyListeners();
  }

  deleteBill(Bill bill) async {
    bill.delete();
    _bills.remove(bill);
    notifyListeners();
  }

  deleteAllBills() {
    _bills.clear();
    box.clear();
    notifyListeners();
  }

  addDummyData() {
    DateTime now = DateTime.now();
    Bill bill1 = Bill(
      title: 'Water',
      dateCreated: now,
      startDate: DateTime(now.year, now.month - 1, now.day),
      repeat: true,
      cost: 50,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.utility,
      category: BillCategory.utility,
    );

    Bill bill2 = Bill(
      title: 'Gas',
      dateCreated: now,
      startDate: now,
      repeat: true,
      cost: 50,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.utility,
      category: BillCategory.utility,
    );

    Bill bill3 = Bill(
      title: 'Netflix',
      dateCreated: now,
      startDate: DateTime(now.year, now.month + 1, now.day),
      repeat: true,
      cost: 50,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.subscription,
      category: BillCategory.utility,
    );

    addBill(bill1);
    addBill(bill2);
    addBill(bill3);
  }
}
