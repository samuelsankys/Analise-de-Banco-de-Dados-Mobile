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

   HiveModel.fromJson(Map<String, dynamic> json, this.A0, this.A1, this.A2, this.A3, this.A4, this.A5) {
    final A0 = json['A0'];
    final A1 = json['A1'];
    final A2 = json['A2'];
    final A3 = json['A3'];
    final A4 = json['A4'];
    final A5 = json['A5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['A0'] = this.A0;
    data['A1'] = this.A1;
    data['A2'] = this.A2;
    data['A3'] = this.A3;
    data['A4'] = this.A4;
    data['A5'] = this.A5;
    return data;
  }
}