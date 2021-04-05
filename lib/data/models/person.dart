import 'package:equatable/equatable.dart';

class Person extends Equatable {
  bool? status;
  String? message;
  List<PersonData>? data;

  Person({this.status, this.message, this.data});

  Person.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<PersonData>.empty(growable: true);
      json['data'].forEach((v) {
        data!.add(new PersonData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [status!, message!, data!];
}

class PersonData extends Equatable {
  String? id;
  String? name;
  String? gender;

  PersonData({this.id, this.name, this.gender});

  PersonData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    return data;
  }

  @override
  List<Object> get props => [id!, name!, gender!];
}
