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

  createBill(Bill bill) async {
    box.add(bill);
    _bills.add(bill);
    notifyListeners();
  }

  updateBill(Bill bill) async {
    bill.save();
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
    Bill adobe = Bill(
      title: 'Adobe',
      dateCreated: now,
      startDate: DateTime(2022, 4, 18),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 30,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.general,
    );

    Bill youtubePremium = Bill(
      title: 'Youtube Premium',
      dateCreated: now,
      startDate: DateTime(2021, 10, 2),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 18,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.entertainment,
    );

    Bill appleOne = Bill(
      title: 'Apple One',
      dateCreated: now,
      startDate: DateTime(2022, 4, 16),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 31.44,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.entertainment,
    );

    Bill planetFitness = Bill(
      title: 'Planet Fitness',
      dateCreated: now,
      startDate: DateTime(2022, 4, 17),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 23.14,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.fitness,
    );

    Bill discoveryPlus = Bill(
      title: 'Discovery +',
      dateCreated: now,
      startDate: DateTime(2021, 2, 12),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 6.99,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.entertainment,
    );

    Bill spectrum = Bill(
      title: 'Spectrum',
      dateCreated: now,
      startDate: DateTime(2022, 1, 18),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 49.99,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.general,
    );

    Bill rentersInsurance = Bill(
      title: 'Lemonade',
      dateCreated: now,
      startDate: DateTime(2021, 11, 1),
      repeat: true,
      occurrence: Occurrence.year,
      cost: 87,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.insurance,
    );

    Bill peacock = Bill(
      title: 'Peacock',
      dateCreated: now,
      startDate: DateTime(2022, 1, 10),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 9.99,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.entertainment,
    );

    Bill carInsurance = Bill(
      title: 'Progressive',
      dateCreated: now,
      startDate: DateTime(2022, 2, 11),
      repeat: true,
      occurrence: Occurrence.biannual,
      cost: 439,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.insurance,
    );

    Bill carRegistration = Bill(
      title: 'Car Registration',
      dateCreated: now,
      startDate: DateTime(2022, 1, 20),
      repeat: true,
      occurrence: Occurrence.year,
      cost: 120,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.general,
    );

    Bill concepts = Bill(
      title: 'Concepts',
      dateCreated: now,
      startDate: DateTime(2022, 1, 19),
      repeat: true,
      occurrence: Occurrence.year,
      cost: 32.24,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.general,
    );

    Bill medium = Bill(
      title: 'Medium',
      dateCreated: now,
      startDate: DateTime(2021, 9, 10),
      repeat: true,
      occurrence: Occurrence.year,
      cost: 53.74,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.general,
    );

    Bill amazonPrime = Bill(
      title: 'Amazon Prime',
      dateCreated: now,
      startDate: DateTime(2022, 3, 6),
      repeat: true,
      occurrence: Occurrence.year,
      cost: 139,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.general,
    );

    Bill epidemicSounds = Bill(
      title: 'Epidemic Sounds',
      dateCreated: now,
      startDate: DateTime(2021, 8, 26),
      repeat: true,
      occurrence: Occurrence.year,
      cost: 144,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.entertainment,
    );

    Bill rent = Bill(
      title: 'Rent',
      dateCreated: now,
      startDate: DateTime(2021, 11, 1),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 1350,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.housing,
    );

    Bill googleBusiness = Bill(
      title: 'Google Business',
      dateCreated: now,
      startDate: DateTime(2022, 1, 24),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 12.81,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.general,
    );

    Bill electricity = Bill(
      title: 'Electricity',
      dateCreated: now,
      startDate: DateTime(2022, 1, 1),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 45,
      notify: false,
      type: BillType.utility,
      category: BillCategory.utility,
    );

    Bill water = Bill(
      title: 'Water',
      dateCreated: now,
      startDate: DateTime(2022, 1, 1),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 20,
      notify: false,
      type: BillType.utility,
      category: BillCategory.utility,
    );

    Bill xboxAllAccess = Bill(
      title: 'Xbox All Access',
      dateCreated: now,
      startDate: DateTime(2022, 1, 15),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 37.68,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.entertainment,
    );

    Bill onePassword = Bill(
      title: '1 Password',
      dateCreated: now,
      startDate: DateTime(2021, 8, 16),
      repeat: true,
      occurrence: Occurrence.year,
      cost: 38.69,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.utility,
    );

    Bill phone = Bill(
      title: 'Phone',
      dateCreated: now,
      startDate: DateTime(2022, 1, 1),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 60,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.telephone,
    );

    Bill watch = Bill(
      title: 'Watch',
      dateCreated: now,
      startDate: DateTime(2022, 1, 1),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 10,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.telephone,
    );

    Bill tv = Bill(
      title: 'TV',
      dateCreated: now,
      startDate: DateTime(2022, 1, 1),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 55,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.entertainment,
    );

    Bill domains = Bill(
      title: 'Domains',
      dateCreated: now,
      startDate: DateTime(2022, 1, 1),
      repeat: true,
      occurrence: Occurrence.year,
      cost: 120,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.general,
    );

    Bill macbookPro = Bill(
      title: 'MacBook Pro',
      dateCreated: now,
      startDate: DateTime(2022, 1, 1),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 280,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.general,
    );

    Bill parking = Bill(
      title: 'Parking',
      dateCreated: now,
      startDate: DateTime(2022, 1, 1),
      repeat: true,
      occurrence: Occurrence.month,
      cost: 50,
      notify: false,
      type: BillType.subscription,
      category: BillCategory.parking,
    );

    createBill(adobe);
    createBill(youtubePremium);
    createBill(appleOne);
    createBill(planetFitness);
    createBill(discoveryPlus);
    createBill(spectrum);
    createBill(rentersInsurance);
    createBill(peacock);
    createBill(carInsurance);
    createBill(carRegistration);
    createBill(concepts);
    createBill(medium);
    createBill(amazonPrime);
    createBill(epidemicSounds);
    createBill(rent);
    createBill(googleBusiness);
    createBill(electricity);
    createBill(water);
    createBill(xboxAllAccess);
    createBill(onePassword);
    createBill(phone);
    createBill(watch);
    createBill(tv);
    createBill(domains);
    createBill(parking);
    createBill(macbookPro);
  }
}
