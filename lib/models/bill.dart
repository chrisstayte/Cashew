import 'dart:collection';

import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurrence.dart';
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
  Map<DateTime, double>? costHistory;

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
    required this.type,
    required this.category,
    this.costHistory,
    this.color,
    this.icon,
    this.endDate,
    this.occurrence,
  });

  DateTime? getNextPaymentDate({DateTime? givenDate}) {
    givenDate = givenDate ?? DateTime.now();

    // If the bills start date is today, just return 'Today'
    if (givenDate.difference(startDate).inDays == 0) {
      return givenDate;
    }

    // If we have passed the end date, just return 'Not due'
    if (endDate != null) {
      if (givenDate.difference(endDate!).inDays > 0) {
        return null;
      }
    }

    // If the bill does not repeat but has not been hit yet return start date
    if (!repeat) {
      if (givenDate.difference(startDate).inDays < 0) {
        return startDate;
        //return '${startDate.month}/${startDate.day}/${startDate.year}';
      } else {
        return null;
      }
    }

    Jiffy jiffy = Jiffy(startDate);

    // If the bill does repeat
    switch (occurrence!) {
      case Occurrence.day:
        return givenDate;
      case Occurrence.week:
        while (jiffy.diff(givenDate, Units.DAY) < 0) {
          jiffy = jiffy.add(weeks: 1);
        }
        break;
      case Occurrence.biweekly:
        while (jiffy.diff(givenDate, Units.DAY) < 0) {
          jiffy = jiffy.add(weeks: 2);
        }
        break;
      case Occurrence.month:
        while (jiffy.diff(givenDate, Units.DAY) < 0) {
          jiffy = jiffy.add(months: 1);
        }
        break;
      case Occurrence.biannual:
        while (jiffy.diff(givenDate, Units.DAY) < 0) {
          jiffy = jiffy.add(months: 6);
        }
        break;
      case Occurrence.year:
        while (jiffy.diff(givenDate, Units.DAY) < 0) {
          jiffy = jiffy.add(years: 1);
        }
        break;
    }

    if (jiffy.diff(givenDate, Units.DAY) == 0) return givenDate;
    return jiffy.dateTime;
  }

  double getMonthlyCost({DateTime? givenDate}) {
    givenDate = givenDate ?? DateTime.now();

    // If it has not yet hit the start date then return zero
    if (startDate.year > givenDate.year) {
      return 0.0;
    } else if (startDate.year == givenDate.year &&
        startDate.month > givenDate.month) {
      return 0.0;
    }

    // If it has an end date and we are past it, then return '0'
    if (endDate != null) {
      if (endDate!.year < givenDate.year) {
        return 0.0;
      } else if (endDate!.year == givenDate.year &&
          endDate!.month < givenDate.month) {
        return 0.0;
      }
    }

    if (repeat) {
      Jiffy windowStart;
      if (startDate.year < givenDate.year) {
        windowStart = Jiffy(givenDate).startOf(Units.MONTH);
      } else if (startDate.month < givenDate.month) {
        windowStart = Jiffy(givenDate).startOf(Units.MONTH);
      } else {
        windowStart = Jiffy(startDate);
      }

      Jiffy windowEnd;
      if (endDate == null) {
        windowEnd = Jiffy(givenDate).endOf(Units.MONTH);
      } else {
        if (endDate!.year > givenDate.year) {
          windowEnd = Jiffy(givenDate).endOf(Units.MONTH);
        } else if (endDate!.month > givenDate.month) {
          windowEnd = Jiffy(givenDate).endOf(Units.MONTH);
        } else {
          windowEnd = Jiffy(endDate!);
        }
      }

      Jiffy currentDate = Jiffy(startDate);
      List<Jiffy> validBillableDatesThisMonth = <Jiffy>[];

      switch (occurrence!) {
        case Occurrence.day:
          while (currentDate.isBefore(windowStart) ||
              currentDate.isSame(windowStart) ||
              currentDate.isSame(windowEnd) ||
              currentDate.isBetween(windowStart, windowEnd)) {
            if (currentDate.isSame(windowStart) ||
                currentDate.isBetween(windowStart, windowEnd) ||
                currentDate.isSame(windowEnd)) {
              validBillableDatesThisMonth.add(currentDate);
            }
            currentDate = currentDate.add(days: 1);
          }
          break;
        case Occurrence.week:
          while (currentDate.isBefore(windowStart) ||
              currentDate.isSame(windowStart) ||
              currentDate.isSame(windowEnd) ||
              currentDate.isBetween(windowStart, windowEnd)) {
            if (currentDate.isSame(windowStart) ||
                currentDate.isBetween(windowStart, windowEnd) ||
                currentDate.isSame(windowEnd)) {
              validBillableDatesThisMonth.add(currentDate);
            }
            currentDate = currentDate.add(weeks: 1);
          }
          break;
        case Occurrence.biweekly:
          while (currentDate.isBefore(windowStart) ||
              currentDate.isSame(windowStart) ||
              currentDate.isSame(windowEnd) ||
              currentDate.isBetween(windowStart, windowEnd)) {
            if (currentDate.isSame(windowStart) ||
                currentDate.isBetween(windowStart, windowEnd) ||
                currentDate.isSame(windowEnd)) {
              validBillableDatesThisMonth.add(currentDate);
            }
            currentDate = currentDate.add(weeks: 2);
          }
          break;
        case Occurrence.month:
          while (currentDate.isBefore(windowStart) ||
              currentDate.isSame(windowStart) ||
              currentDate.isSame(windowEnd) ||
              currentDate.isBetween(windowStart, windowEnd)) {
            if (currentDate.isSame(windowStart) ||
                currentDate.isBetween(windowStart, windowEnd) ||
                currentDate.isSame(windowEnd)) {
              validBillableDatesThisMonth.add(currentDate);
            }
            currentDate = currentDate.add(months: 1);
          }
          break;
        case Occurrence.biannual:
          return (cost / 6.0);
        case Occurrence.year:
          return (cost / 12.0);
      }

      return (cost * validBillableDatesThisMonth.length);
    } else {
      // If only occurs once then make sure it's in this month and then return that value
      if (givenDate.month == startDate.month &&
          givenDate.year == givenDate.year) return cost;
    }

    return 0.0;
  }
}
