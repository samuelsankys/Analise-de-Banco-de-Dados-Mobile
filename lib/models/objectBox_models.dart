import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxModel {
  int id;
  int A0;
  double A1;
  String A2;
  String A3;
  String A4;
  DateTime A5;

  ObjectBoxModel({
    this.id = 0, 
    required this.A0, 
    required this.A1, 
    required this.A2, 
    required this.A3, 
    required this.A4, 
    required this.A5
    });
}
