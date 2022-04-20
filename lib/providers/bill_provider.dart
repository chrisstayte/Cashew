import 'dart:collection';

import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurrence.dart';
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
      title: 'Water - Started One Month Before Today',
      dateCreated: now,
      startDate: DateTime(now.year, now.month - 1, now.day),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 5,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.utility,
      category: BillCategory.utility,
    );

    Bill bill2 = Bill(
      title: 'Gas - Starts Today',
      dateCreated: now,
      startDate: now,
      repeat: true,
      occurrence: Occurrence.month,
      cost: 50,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.utility,
      category: BillCategory.utility,
    );

    Bill bill3 = Bill(
      title: 'Netflix - Starts One Month From Today',
      dateCreated: now,
      startDate: DateTime(now.year, now.month + 1, now.day),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 150,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.subscription,
      category: BillCategory.utility,
    );

    Bill bill4 = Bill(
      title: 'Spotify + Starts One Month From Today, No Repeat',
      dateCreated: now,
      startDate: DateTime(now.year, now.month + 1, now.day),
      repeat: false,
      cost: 50,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.subscription,
      category: BillCategory.utility,
    );

    Bill bill5 = Bill(
      title: 'END Date',
      dateCreated: now,
      startDate: DateTime(now.year, now.month + 1, now.day),
      endDate: DateTime(now.year, now.month, now.day - 1),
      repeat: true,
      occurrence: Occurrence.week,
      cost: 550,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.subscription,
      category: BillCategory.utility,
    );

    Bill bill6 = Bill(
      title: 'END D44ate',
      dateCreated: now,
      startDate: DateTime(now.year, now.month + 1, now.day),
      endDate: DateTime(now.year, now.month, now.day - 1),
      repeat: true,
      occurrence: Occurrence.week,
      cost: 550,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.financed,
      category: BillCategory.utility,
    );

    Bill bill7 = Bill(
      title: 'END 4324Date',
      dateCreated: now,
      startDate: DateTime(now.year, now.month + 1, now.day),
      endDate: DateTime(now.year, now.month, now.day - 1),
      repeat: true,
      occurrence: Occurrence.week,
      cost: 50,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.financed,
      category: BillCategory.utility,
    );

    Bill sampleWorking = Bill(
      title: 'Once A Month',
      dateCreated: now,
      startDate: DateTime(now.year, now.month - 1, now.day + 3),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 540,
      notify: true,
      costHistory: Map<DateTime, double>(),
      type: BillType.subscription,
      category: BillCategory.utility,
    );

    addBill(bill1);
    addBill(bill2);
    addBill(bill3);
    addBill(bill4);
    addBill(bill5);
    addBill(bill6);
    addBill(bill7);
    addBill(sampleWorking);
  }
}
