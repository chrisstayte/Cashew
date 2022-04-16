import 'package:hive/hive.dart';

part 'occurance.g.dart';

@HiveType(typeId: 3)
enum Occurance {
  @HiveField(0)
  day,

  @HiveField(1)
  week,

  @HiveField(2)
  month,

  @HiveField(3)
  quarter,

  @HiveField(4)
  year
}
