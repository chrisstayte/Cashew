import 'package:hive/hive.dart';

part 'bill_category.g.dart';

@HiveType(typeId: 2)
enum BillCategory {
  @HiveField(0)
  general,

  @HiveField(1)
  utility,

  @HiveField(2)
  entertainment,

  @HiveField(3)
  auto,

  @HiveField(4)
  housing,

  @HiveField(5)
  healthCare,

  @HiveField(6)
  studentLoan,

  @HiveField(7)
  fitness,

  @HiveField(8)
  sports,

  @HiveField(9)
  food,

  @HiveField(10)
  insurance,

  @HiveField(11)
  telephone,

  @HiveField(12)
  parking,
}
