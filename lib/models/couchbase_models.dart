
class CouchBaseModel {
  int? id;
  int? A0;
  double? A1;
  String? A2;
  String? A3;
  String? A4;
  String? A5;

  CouchBaseModel({this.id, this.A0, this.A1, this.A2, this.A3, this.A4, this.A5});

  CouchBaseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    A0 = json['A0'];
    A1 = json['A1'];
    A2 = json['A2'];
    A3 = json['A3'];
    A4 = json['A4'];
    A5 = json['A5'];
  }

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