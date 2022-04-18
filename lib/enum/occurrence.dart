import 'package:hive/hive.dart';

part 'occurrence.g.dart';

@HiveType(typeId: 3)
enum Occurrence {
  @HiveField(0)
  day,

  @HiveField(1)
  week,

  @HiveField(2)
  biweekly,

  @HiveField(3)
  month,

  @HiveField(4)
  biannual,

  @HiveField(5)
  year
}
