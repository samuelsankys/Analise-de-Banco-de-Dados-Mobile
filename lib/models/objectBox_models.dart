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
    
    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['A0'] = this.A0;
    data['A1'] = this.A1;
    data['A2'] = this.A2;
    data['A3'] = this.A3;
    data['A4'] = this.A4;
    data['A5'] = this.A5;
    return data;
  }
}
