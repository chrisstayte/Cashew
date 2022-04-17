import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';

part 'bill.g.dart';

@HiveType(typeId: 0)
class Bill extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime dateCreated;

  @HiveField(2)
  DateTime startDate;

  @HiveField(3)
  DateTime? endDate;

  @HiveField(4)
  bool repeat;

  @HiveField(5)
  Occurrence? occurrence;

  @HiveField(6)
  double cost;

  @HiveField(7)
  Map<DateTime, double> costHistory;

  @HiveField(8)
  IconData? icon;

  @HiveField(9)
  Color? color;

  @HiveField(10)
  bool notify;

  @HiveField(11)
  BillType type;

  @HiveField(12)
  BillCategory category;

  Bill({
    required this.title,
    required this.dateCreated,
    required this.startDate,
    required this.repeat,
    required this.cost,
    required this.notify,
    required this.costHistory,
    required this.type,
    required this.category,
    this.color,
    this.icon,
    this.endDate,
    this.occurrence,
  });

  String getNextPaymentDate({DateTime? givenDate}) {
    givenDate = givenDate ?? DateTime.now();

    // If the bills start date is today, just return 'Today'
    if (givenDate.difference(startDate).inDays == 0) {
      return 'Today';
    }

    // If we have passed the end date, just return 'Not due'
    if (endDate != null) {
      if (givenDate.difference(endDate!).inDays > 0) {
        return 'Not due';
      }
    }

    // If the bill does not repeat but has not been hit yet return start date
    if (!repeat) {
      if (givenDate.difference(startDate).inDays < 0) {
        return '${startDate.month}/${startDate.day}/${startDate.year}';
      }
    }

    // If the bill does repeat
    switch (occurrence!) {
      case Occurrence.day:
        return 'Today';
      case Occurrence.week:
        Jiffy jiffy = Jiffy(startDate);

        while (jiffy.diff(givenDate, Units.DAY) < 0) {
          jiffy = jiffy.add(weeks: 1);
        }

        if (jiffy.diff(givenDate, Units.DAY) == 0) return 'Today';
        return '${jiffy.month}/${jiffy.date}/${jiffy.year}';

      case Occurrence.month:
        Jiffy jiffy = Jiffy(startDate);

        while (jiffy.diff(givenDate, Units.DAY) < 0) {
          jiffy = jiffy.add(months: 1);
        }

        if (jiffy.diff(givenDate, Units.DAY) == 0) return 'Today';
        return '${jiffy.month}/${jiffy.date}/${jiffy.year}';

      case Occurrence.biannual:
        Jiffy jiffy = Jiffy(startDate);

        while (jiffy.diff(givenDate, Units.DAY) < 0) {
          jiffy = jiffy.add(months: 6);
        }

        if (jiffy.diff(givenDate, Units.DAY) == 0) return 'Today';
        return '${jiffy.month}/${jiffy.date}/${jiffy.year}';

      case Occurrence.year:
        Jiffy jiffy = Jiffy(startDate);

        while (jiffy.diff(givenDate, Units.DAY) < 0) {
          jiffy = jiffy.add(years: 1);
        }

        if (jiffy.diff(givenDate, Units.DAY) == 0) return 'Today';
        return '${jiffy.month}/${jiffy.date}/${jiffy.year}';
    }

    return 'FIGURE IT OUT';
  }

  double getMonthlyCost(DateTime? givenDate) {
    givenDate = givenDate ?? DateTime.now();

    // If it has an end date and we are past it, then return '0'
    if (endDate != null) {
      // 2020 > 2019
      if (givenDate.year > endDate!.year) {
        // 12 > 11 (December > November)
        if (givenDate.month > endDate!.month) {
          return 0.0;
        }
      }
    }

    // If only occurs once then make sure it's in this month and then return that value
    if (!repeat) {
      if (givenDate.year == startDate.year &&
          givenDate.month == startDate.month) {
        return cost;
      }
    }

    return 0.0;
  }

  // If the event occurs more than once than configure cost

}
