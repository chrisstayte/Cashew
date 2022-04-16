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
  rent,

  @HiveField(5)
  mortgage
}
