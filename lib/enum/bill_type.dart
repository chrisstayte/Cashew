import 'package:hive/hive.dart';

part 'bill_type.g.dart';

@HiveType(typeId: 1)
enum BillType {
  @HiveField(0)
  utility,

  @HiveField(1)
  subscription,

  @HiveField(2)
  financed,
}
