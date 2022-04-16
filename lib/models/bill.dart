import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
  Occurance? occurance;

  @HiveField(6)
  int? occuranceRate;

  @HiveField(7)
  double cost;

  @HiveField(8)
  Map<DateTime, double> costHistory;

  @HiveField(9)
  IconData? icon;

  @HiveField(10)
  Color? color;

  @HiveField(11)
  bool notify;

  @HiveField(12)
  BillType type;

  @HiveField(13)
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
    this.occurance,
    this.occuranceRate,
  });
}
