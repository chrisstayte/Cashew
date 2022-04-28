import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/utilities/double_extensions.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var jiffy1 = Jiffy("2020-01-02", "yyyy-MM-dd");

  var jiffy2 = Jiffy("2021-01-01", "yyyy-MM-dd");
  var jiffy3 = Jiffy("2021-01-30", "yyyy-MM-dd");

  print(jiffy1.isBetween(jiffy2, jiffy3));
  print(jiffy1.isSame(jiffy2, Units.DAY));
  print(jiffy1.isSame(jiffy3, Units.DAY));

  Bill bill = Bill(
    title: "Daily 10 Dollars",
    category: BillCategory.general,
    type: BillType.utility,
    repeat: true,
    occurrence: Occurrence.day,
    startDate: DateTime(2022, 1, 1),
    dateCreated: DateTime.now(),
    notify: false,
    cost: 10,
  );

  print(bill.getMonthlyCost(givenDate: DateTime(2022, 2, 4)).currency);
}
