import 'package:hive/hive.dart';

part 'occurrence.g.dart';

@HiveType(typeId: 3)
enum Occurrence {
  @HiveField(0)
  day,

  @HiveField(1)
  week,

  @HiveField(2)
  month,

  @HiveField(3)
  biannual,

  @HiveField(4)
  year
}
