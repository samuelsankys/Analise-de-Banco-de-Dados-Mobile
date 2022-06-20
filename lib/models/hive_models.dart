import 'package:hive/hive.dart';

part 'hive_models.g.dart';

@HiveType(typeId: 0)
class HiveModel extends HiveObject{

  @HiveField(0)
  final int A0;

  @HiveField(1)
  final double A1;

  @HiveField(2)
  final String A2;

  @HiveField(3)
  final String A3;

  @HiveField(4)
  final String A4;

  @HiveField(5)
  final String A5;

  HiveModel(this.A0, this.A1, this.A2,this.A3,this.A4,this.A5);
}