import 'package:hive/hive.dart';
part 'savings.g.dart';

@HiveType(typeId: 0)
class Savings extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? money;

  @HiveField(2)
  String? dorm;

  Savings({
    this.name,
    this.money,
    this.dorm,
  });
}
