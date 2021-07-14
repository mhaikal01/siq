import 'package:hive/hive.dart';
part 'savings.g.dart';

@HiveType(typeId: 0)
class Savings extends HiveObject {
  @HiveField(0)
  late String? name;

  @HiveField(1)
  late String? money;

  @HiveField(2)
  late String? dorm;

  @HiveField(3)
  late String? date;

  Savings({
    this.name,
    this.money,
    this.dorm,
    this.date,
  });
}
